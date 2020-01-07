# -*- coding: utf-8 -*-
import datetime, sys, os
from django.contrib.auth.decorators import login_required
from dateutil.relativedelta import relativedelta
from django.utils.crypto import get_random_string
from django.core.mail import EmailMessage
from django.shortcuts import render
from django.http import Http404, HttpResponseRedirect, JsonResponse
from owncalendar import ContestCalendar
from django.contrib.auth.hashers import check_password
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, logout
from django.contrib.auth import login as auth_login
from django.db.models import Q
from ProyectoForms import *
from models import *

def index(request):
    try:
        if request.user.is_authenticated():
	    return HttpResponseRedirect('/evaluar/inicio/')
    except Exception:
	pass
    return render(request,'index.html')

def logout(request):
    request.session.flush()
    return HttpResponseRedirect('/index/')

def signup(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            auth_login(request, user)
            return HttpResponseRedirect('/index/')
    else:
        form = RegisterForm()
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/index'},
        {'name': 'Registro'}
        ]
    context ={'form': form, 'breadcrumbnav':breadcrumbnav}
    return render(request, 'admin/registro.html', context)

def login(request):
    errors = []
    linknext = request.GET.get('next','/index/')
    try:
	if request.user.is_authenticated():
    	    return HttpResponseRedirect('/index/')
    except Exception:
	pass
    if request.method == 'POST':
        form = FormularioLogin(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            try:
                username = User.objects.get(Q(username=username) | Q(email=username)).username
                user = authenticate(username=username, password=password)
                if user.check_password(password):
                    auth_login(request, user)
                    return HttpResponseRedirect(linknext)
            except User.DoesNotExist:
                errors.append('Usuario incorrecto.')
            except Exception as e:
                errors.append('Contraseña incorrecta.')
    else:
        form = FormularioLogin()
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/index'},
        {'name': 'Login'}
        ]
    context ={'form': form, 'breadcrumbnav':breadcrumbnav,'errors':errors}
    return render (request, 'admin/login.html', context)

def ayuda(request):
    return render(request,'help/help.html')

@login_required(login_url='/login/')
def actualizar_perfil(request):
    messages = []
    errors = []
    if request.method == 'POST':
        form = UserUpdateForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            messages.append('Se actualizaron correctamente los datos.')
        else:
            errors.append('No se actualizaron los datos.')
    else:
        form = UserUpdateForm(instance=request.user)
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/index'},
        {'name': 'Actualizar perfil'}
        ]
    context ={'form': form, 'breadcrumbnav':breadcrumbnav, 'messages':messages, 'errors':errors}
    return render (request, 'admin/update.html', context)
    
def actualizar_contrasena(request):
    messages = []
    errors = []
    if request.method == 'POST':
        form = PasswordChangeForm(user=request.user, data=request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
    else:
        form = PasswordChangeForm(user=request.user)
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/index'},
        {'name': 'Actualizar contraseña'}
        ]
    context ={'form': form, 'breadcrumbnav':breadcrumbnav, 'messages':messages, 'errors':errors}
    return render (request, 'admin/update.html', context)

def recover(request):
    errors = []
    messages = []
    if request.method == 'POST':
        form = FormularioRecover(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            try:
                user = User.objects.get(email=email)
                token = get_random_string(length=64)
                TokenDeContrasena.objects.filter(usuario=user).update(estatus=False)
                TokenDeContrasena.objects.create(token= token, usuario=user)
                if notifyPasswordToken(request,user,token):
                    messages.append('Revise su correo electronico, se envió un link para recuperar su contraseña.')
                else:
                    errors.append("No se puede notificar, intente más tarde.")
            except User.DoesNotExist:
                errors.append("Usuario no encontrado.")
            except Exception as e:
                errors.append("A ocurrido un error."+str(e))
    else:
        form = FormularioRecover()
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/index'},
        {'name': 'Recuperación'}
        ]
    context ={'form': form, 'breadcrumbnav':breadcrumbnav, 'errors':errors, 'messages':messages}
    return render (request, 'admin/recover.html', context)

def reset_password(request, token):
    errors = []
    messages = []
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/index'},
        {'name': 'Recuperación'}
        ]
    try:
        token = TokenDeContrasena.objects.get(token=token, estatus=True)
        user = User.objects.get(pk=token.usuario.id)
    except Exception as e:
        errors.append('Token invalido!. Envie nuevemente el correo de recuperacion.')
        form = FormularioRecover()
	context ={'form': form, 'breadcrumbnav':breadcrumbnav, 'errors':errors, 'messages':messages}
	return render (request, 'admin/recover.html', context)
    if request.method == 'POST':
        form = PasswordChangeForm(request.POST)
        if form.is_valid():
            if form.cleaned_data['password'] == form.cleaned_data['cn_password']:
                user.set_password(form.cleaned_data['password'])
                user.save()
                token.estatus = False
                token.save()
                messages.append('La contraseña fue actualizada exitosamente.')
            else:
                errors.append('Las contraseñas no son iguales.')
    else:
        form = PasswordChangeForm()
    context ={'form': form, 'breadcrumbnav':breadcrumbnav, 'errors':errors, 'messages':messages}
    return render (request, 'admin/recover.html', context)

def registrar_usuario(request):
    errors = []
    if request.method == 'POST':
        form = FormularioRegistrarUser(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/index/")
    else:
        form = FormularioRegistrarUser()
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/index'},
        {'name': 'Registro'}
        ]
    context ={'form': form, 'breadcrumbnav':breadcrumbnav}
    return render (request, 'inicio/agregar.html', context)

@login_required(login_url='/login/')
def inicio(request):
    breadcrumbnav = []
    proyectos_allowed = [rol.proyecto.id for rol in  RolDeProyecto.objects.filter(usuario=request.user,rol=5)]# 5 is the id's project leader role
    proyectos = Proyecto.objects.filter(Q(pk__in=proyectos_allowed) | Q(usuario_registro=request.user))
    context ={'proyectos':proyectos, 'breadcrumbnav':breadcrumbnav}
    return render(request, 'inicio/proyectos.html', context)

@login_required(login_url='/login/')
def registrar_proyecto(request):
    errors = []
    print(request.POST)
    if request.method == 'POST':
        form = FormularioProyecto(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/administrar/inicio/")
    else:
        form = FormularioProyecto(initial={'usuario_registro': request.user})
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Registrar'}
        ]
    context ={'form': form, 'breadcrumbnav':breadcrumbnav, 'previous_url':'/administrar/inicio'}
    return render (request, 'inicio/agregar.html', context)

@login_required(login_url='/login/')
def aprobar_proyecto(request, id_proyecto):
    errors = []
    try:
        id_proyecto = parse_int(id_proyecto)
        proyecto = Proyecto.objects.get(id=id_proyecto)
    except Exception as e:
        return Http404()
    errors = check_project(proyecto)
    if request.method == 'POST':
        form = FormularioAprobarProyecto(request.POST, instance=proyecto)
        if form.is_valid():
            form.save()
            if form.cleaned_data['estatus']:
                #Notify roles
                roles = RolDeProyecto.objects.filter(proyecto=proyecto)
                for rol in roles: notifyRol(request, rol,'ADD')
            return HttpResponseRedirect("/administrar/inicio/")
    else:
        form = FormularioAprobarProyecto(instance=proyecto)
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Aprobar proyecto'}
        ]
    context ={'form': form, 'breadcrumbnav':breadcrumbnav, 'errors':errors, 'proyecto':proyecto}
    return render (request, 'inicio/verificar_proyecto.html', context)

@login_required(login_url='/login/')
def ver_proyecto(request, id_proyecto):
    try:
        id_proyecto = parse_int(id_proyecto)
        proyecto = Proyecto.objects.get(id=id_proyecto)
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    fases_de_proyecto = FaseDeProyecto.objects.filter(proyecto=proyecto)
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Fases'}
        ]
    context = {'proyecto': proyecto, 'fases_de_proyecto':fases_de_proyecto, 'breadcrumbnav':breadcrumbnav}
    return render (request, 'inicio/fases_de_proyecto.html', context)

@login_required(login_url='/login/')
def ver_roles_de_proyecto(request, id_proyecto):
    try:
        id_proyecto = parse_int(id_proyecto)
        proyecto = Proyecto.objects.get(id=id_proyecto)
        roles = RolDeProyecto.objects.filter(proyecto=proyecto)
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Roles'}
    ]
    context = {'proyecto': proyecto, 'roles':roles, 'breadcrumbnav':breadcrumbnav}
    return render (request, 'inicio/roles_de_proyecto.html', context)

@login_required(login_url='/login/')
def agregar_rol_de_proyecto(request, id_proyecto):
    try:
        id_proyecto = parse_int(id_proyecto)
        proyecto = Proyecto.objects.get(id=id_proyecto)
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    if request.method == 'POST':
        form = FormularioRol(request.POST)
        if form.is_valid():
            rol = RolDeProyecto()
            rol.rol = form.cleaned_data['rol']
            rol.usuario = User.objects.get(email=form.cleaned_data['usuario'])
            rol.proyecto = proyecto
            rolDeProyecto = rol.save()
            return HttpResponseRedirect("/administrar/proyecto/roles/"+str(id_proyecto))
    else:
        form = FormularioRol(initial={'proyecto': proyecto})
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Roles', 'link': '/administrar/proyecto/roles/'+str(proyecto.id)},
        {'name': 'Agregar'}
    ]
    context = {'form':form, 'object':proyecto, 'breadcrumbnav':breadcrumbnav, 'previous_url':'/administrar/proyecto/roles/'+str(proyecto.id)}
    return render (request, 'inicio/agregar.html', context)

@login_required(login_url='/login/')
def ver_calendario_de_proyecto(request, id_proyecto, year=datetime.datetime.now().year, month=datetime.datetime.now().month, formatyear=False):
    try:
        id_proyecto = parse_int(id_proyecto)
        year = int(year)
        month = int(month)
        proyecto = Proyecto.objects.get(id=id_proyecto)
        eventos_de_proyecto = EventoDeProyecto.objects.filter(proyecto=proyecto)
        calendarSchedule = ContestCalendar(id_proyecto)
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    if formatyear:
        calendarSchedule = calendarSchedule.formatyear(year, 3)
    else:
        calendarSchedule = calendarSchedule.formatmonth(year, month, True)
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Eventos'}
    ]
    renderdate = datetime.date(year,month,1)

    anterior = (datetime.date(year,month,1)+ relativedelta(months=-1)).strftime('%Y/%m/')
    hoy = datetime.date.today().strftime('%Y/%m/')
    siguiente = (datetime.date(year,month,1)+ relativedelta(months=1)).strftime('%Y/%m/')
    context = {
        'proyecto': proyecto,
        'eventos_de_proyecto': eventos_de_proyecto,
        'breadcrumbnav': breadcrumbnav,
        'calendar': calendarSchedule,
        'anterior': '/administrar/proyecto/eventos/'+str(proyecto.id)+'/'+str(anterior),
        'hoy': '/administrar/proyecto/eventos/'+str(proyecto.id)+'/'+hoy,
        'siguiente': '/administrar/proyecto/eventos/'+str(proyecto.id)+'/'+str(siguiente),
        }
    return render (request, 'inicio/eventos_de_proyecto.html', context)

@login_required(login_url='/login/')
def ver_evento(request, id_evento):
    try:
        id_evento = parse_int(id_evento)
        evento_de_proyecto = EventoDeProyecto.objects.get(id=id_evento)
        proyecto = evento_de_proyecto.proyecto
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Eventos', 'link': '/administrar/proyecto/eventos/'+str(proyecto.id)},
        {'name': evento_de_proyecto}
    ]
    context = {'proyecto': proyecto, 'evento':evento_de_proyecto, 'breadcrumbnav':breadcrumbnav}
    return render (request, 'inicio/ver_evento.html', context)

@login_required(login_url='/login/')
def agregar_evento_de_proyecto(request, id_proyecto, year=datetime.datetime.now().year, month=datetime.datetime.now().month, day=datetime.datetime.now().day):
    try:
        fecha = datetime.datetime(int(year),int(month),int(day))
        id_proyecto = parse_int(id_proyecto)
        proyecto = Proyecto.objects.get(id=id_proyecto)
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    if request.method == 'POST':
        form = FormularioEvento(request.POST, initial={'proyecto': proyecto,'fecha':fecha})
        if form.is_valid():
            evento = form.save()
            if evento:
                return HttpResponseRedirect("/administrar/proyecto/eventos/"+str(id_proyecto)+"/")
    else:
        form = FormularioEvento(initial={'proyecto': proyecto,'fecha':fecha})
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Eventos', 'link': '/administrar/proyecto/eventos/'+str(proyecto.id)},
        {'name': 'Agregar'}
    ]
    context = {'form':form, 'object':proyecto, 'breadcrumbnav':breadcrumbnav, 'previous_url':'/administrar/proyecto/eventos/'+str(proyecto.id)}
    return render (request, 'inicio/agregar.html', context)

@login_required(login_url='/login/')
def agregar_fase_de_proyecto(request, id_proyecto):
    try:
        id_proyecto = parse_int(id_proyecto)
        proyecto = Proyecto.objects.get(id=id_proyecto)
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    if request.method == 'POST':
        form = FormularioFase(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/administrar/proyecto/"+str(id_proyecto))
    else:
        form = FormularioFase(initial={'proyecto': proyecto})
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Fases', 'link': '/administrar/proyecto/'+str(proyecto.id)},
        {'name': 'Agregar'}
    ]
    context = {'form':form, 'object':proyecto, 'breadcrumbnav':breadcrumbnav, 'previous_url':'/administrar/proyecto/'+str(proyecto.id)}
    return render (request, 'inicio/agregar.html', context)

@login_required(login_url='/login/')
def ver_fase_de_proyecto(request, id_fase_proyecto):
    try:
        id_fase_proyecto = parse_int(id_fase_proyecto)
        fase = FaseDeProyecto.objects.get(id=id_fase_proyecto)
        productos_de_fase = ProductoDeTrabajoDeFase.objects.filter(fase_id=id_fase_proyecto)
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Fases', 'link': '/administrar/proyecto/'+str(fase.proyecto.id)},
        {'name': fase}
    ]
    context = {'fase':fase, 'productos_de_fase':productos_de_fase, 'breadcrumbnav':breadcrumbnav}
    return render (request, 'inicio/productos_de_fase.html', context)

@login_required(login_url='/login/')
def agregar_producto_a_fase(request, id_fase_proyecto):
    try:
        id_fase_proyecto = parse_int(id_fase_proyecto)
        fase_proyecto = FaseDeProyecto.objects.get(id=id_fase_proyecto)
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    if request.method == 'POST':
        form = FormularioProductoDeFase(fase_proyecto, request.POST, request.FILES)
        if form.is_valid():
            if form.save():
                return HttpResponseRedirect("/administrar/proyecto/fase/%s/" % id_fase_proyecto)
    else:
        form = FormularioProductoDeFase(fase_proyecto)
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Fases', 'link': '/administrar/proyecto/'+str(fase_proyecto.proyecto.id)},
        {'name': fase_proyecto.fase, 'link': '/administrar/proyecto/fase/'+str(fase_proyecto.id)},
        {'name': 'Agregar'}
    ]
    context = {'form':form, 'object':fase_proyecto, 'breadcrumbnav':breadcrumbnav, 'previous_url':'/administrar/proyecto/fase/'+str(fase_proyecto.id)}
    return render (request, 'inicio/agregar.html', context)

@login_required(login_url='/login/')
def editar_producto_de_fase(request, id_producto_de_fase):
    try:
        id_producto_de_fase = parse_int(id_producto_de_fase)
        producto_de_fase = ProductoDeTrabajoDeFase.objects.get(id=id_producto_de_fase)
        producto_de_fase.ultima_actualizacion= datetime.datetime.now()
        fase_proyecto = FaseDeProyecto.objects.get(id=producto_de_fase.fase.id)
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    if request.method == 'POST':
        form = FormularioEditarProductoDeFase(request.POST, request.FILES, instance=producto_de_fase)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/administrar/proyecto/fase/%s/" % producto_de_fase.fase.id)
    else:
        form = FormularioEditarProductoDeFase(instance=producto_de_fase)
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Fases', 'link': '/administrar/proyecto/'+str(fase_proyecto.proyecto.id)},
        {'name': fase_proyecto.fase, 'link': '/administrar/proyecto/fase/'+str(fase_proyecto.id)},
        {'name': 'Editar'}
    ]
    context = {'form':form, 'object':fase_proyecto, 'breadcrumbnav':breadcrumbnav, 'previous_url':'/administrar/proyecto/fase/'+str(fase_proyecto.id)}
    return render (request, 'inicio/agregar.html', context)

@login_required(login_url='/login/')
def ver_producto(request, id_producto_de_fase):
    try:
        id_producto_de_fase = parse_int(id_producto_de_fase)
        producto_de_fase = ProductoDeTrabajoDeFase.objects.get(id=id_producto_de_fase)
        criterios = CriterioDeProducto.objects.filter(producto=producto_de_fase)
        metricas = MetricaDeProducto.objects.filter(producto=producto_de_fase)
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Fases', 'link': '/administrar/proyecto/'+str(producto_de_fase.fase.proyecto.id)},
        {'name': producto_de_fase.fase, 'link': '/administrar/proyecto/fase/'+str(producto_de_fase.fase.id)},
        {'name': producto_de_fase.producto}
    ]
    context = {'producto':producto_de_fase, 'criterios':criterios, 'metricas':metricas, 'breadcrumbnav':breadcrumbnav}
    return render(request, 'inicio/criterios_de_producto.html', context)

@login_required(login_url='/login/')
def asignar_criterios_a_producto(request, id_producto_de_fase):
    try:
        id_producto_de_fase = parse_int(id_producto_de_fase)
        producto_de_fase = ProductoDeTrabajoDeFase.objects.get(id=id_producto_de_fase)
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    if request.method == 'POST':
        form = FormularioCriteriosDeProducto(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/administrar/proyecto/fase/producto/%s/" % id_producto_de_fase)
    else:
        form = FormularioCriteriosDeProducto(initial={'producto': producto_de_fase,})
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Fases', 'link': '/administrar/proyecto/'+str(producto_de_fase.fase.proyecto.id)},
        {'name': producto_de_fase.fase, 'link': '/administrar/proyecto/fase/'+str(producto_de_fase.fase.id)},
        {'name': producto_de_fase.producto, 'link': '/administrar/proyecto/fase/producto/'+str(producto_de_fase.id)},
        {'name': 'Criterios'}
    ]
    context = {'form': form, 'object':producto_de_fase, 'breadcrumbnav':breadcrumbnav, 'previous_url':'/administrar/proyecto/fase/producto/'+str(producto_de_fase.id)}
    return render(request, 'inicio/agregar.html', context)

@login_required(login_url='/login/')
def asignar_metricas_a_producto(request, id_producto_de_fase):
    try:
        id_producto_de_fase = parse_int(id_producto_de_fase)
        producto_de_fase = ProductoDeTrabajoDeFase.objects.get(id=id_producto_de_fase)
        metricas = Metrica.objects.in_bulk([2])#metrica.id for metrica in producto_de_fase.producto.metricas.all()
    except Exception as e:
        return HttpResponseRedirect("/administrar/inicio/")
    if request.method == 'POST':
        form = FormularioMetricasDeProducto(producto_de_fase, request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/administrar/proyecto/fase/producto/%s/" % id_producto_de_fase)
    else:
        form = FormularioMetricasDeProducto(producto_de_fase)
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Fases', 'link': '/administrar/proyecto/'+str(producto_de_fase.fase.proyecto.id)},
        {'name': producto_de_fase.fase, 'link': '/administrar/proyecto/fase/'+str(producto_de_fase.fase.id)},
        {'name': producto_de_fase.producto, 'link': '/administrar/proyecto/fase/producto/'+str(producto_de_fase.id)},
        {'name': 'Metricas'}
    ]
    form_title = 'Agregar métrica'
    context = {'form': form, 'object':producto_de_fase, 'breadcrumbnav':breadcrumbnav, 'form_title':form_title, 'previous_url':'/administrar/proyecto/fase/producto/'+str(producto_de_fase.id)}
    return render(request, 'inicio/agregar.html', context)

@login_required(login_url='/login/')
def editar_metrica_de_producto(request, id_metrica_de_producto):
    try:
        id_metrica_de_producto = parse_int(id_metrica_de_producto)
        metrica_de_producto = MetricaDeProducto.objects.get(pk=id_metrica_de_producto)
    except Exception as e:
        raise e
    if request.method == 'POST':
        form = FormularioMetricasDeProductoEdit(request.POST, instance=metrica_de_producto)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/administrar/proyecto/fase/producto/%s/" % metrica_de_producto.producto.id)
    else:
        form = FormularioMetricasDeProductoEdit(instance=metrica_de_producto)
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/administrar/inicio'},
        {'name': 'Fases', 'link': '/administrar/proyecto/'+str(metrica_de_producto.producto.fase.proyecto.id)},
        {'name': metrica_de_producto.producto.fase, 'link': '/administrar/proyecto/fase/'+str(metrica_de_producto.producto.fase.id)},
        {'name': metrica_de_producto.producto.producto, 'link': '/administrar/proyecto/fase/producto/'+str(metrica_de_producto.producto.id)},
        {'name': 'Metricas'}
    ]
    form_title = 'Editar métrica'
    context = {'form': form, 'object':metrica_de_producto.producto, 'breadcrumbnav':breadcrumbnav, 'form_title':form_title, 'previous_url':'/administrar/proyecto/fase/producto/'+str(metrica_de_producto.producto.id)}
    return render(request, 'inicio/agregar.html', context)

@login_required(login_url='/login/')
def eliminar_registro(request, case, id_registro):
    try:
        id_registro = parse_int(id_registro)
        breadcrumbnav = [
                {'name': 'Inicio', 'link':'/administrar/inicio'},
                {'name':'Eliminar'}
        ]
	previous_url = "/administrar/inicio"
        errors = []
        if case=='proyecto':
            element = Proyecto.objects.get(id=id_registro)
            proyecto = element
            breadcrumbnav =[
                {'name': 'Inicio', 'link':'/administrar/inicio'},
                {'name':'Eliminar'}
            ]
    	    previous_url = "/administrar/inicio"
        elif case=='fase':
            element = FaseDeProyecto.objects.get(id=id_registro)
            proyecto = element.proyecto
            breadcrumbnav =[
                {'name': 'Inicio', 'link':'/administrar/inicio'},
                {'name':'Fases','link':'/administrar/proyecto/'+str(element.proyecto.id)},
                {'name':'Eliminar'}
            ]
    	    previous_url = "/administrar/proyecto/"+str(element.proyecto.id)
        elif case=='evento':
            element = EventoDeProyecto.objects.get(id=id_registro)
            proyecto = element.proyecto
            breadcrumbnav =[
                {'name': 'Inicio', 'link':'/administrar/inicio'},
                {'name':'Eventos','link':'/administrar/proyecto/eventos/'+str(element.proyecto.id)},
                {'name':'Eliminar'}
            ]
    	    previous_url = "/administrar/proyecto/eventos/"+str(element.proyecto.id)
        elif case=='rol':
            element = RolDeProyecto.objects.get(id=id_registro)
            proyecto = element.proyecto
            breadcrumbnav =[
                {'name': 'Inicio', 'link':'/administrar/inicio'},
                {'name':'Roles','link':'/administrar/proyecto/roles/'+str(element.proyecto.id)},
                {'name':'Eliminar'}
            ]
    	    previous_url = "/administrar/proyecto/roles/"+str(element.proyecto.id)
        elif case=='producto':
            element = ProductoDeTrabajoDeFase.objects.get(id=id_registro)
            proyecto = element.fase.proyecto
            breadcrumbnav =[
                {'name': 'Inicio', 'link':'/administrar/inicio'},
                {'name':'Fases','link':'/administrar/proyecto/'+str(element.fase.proyecto.id)},
                {'name':element.fase,'link':'/administrar/proyecto/fase/'+str(element.fase.id)},
                {'name':'Eliminar'}
            ]
    	    previous_url = "/administrar/proyecto/fase/"+str(element.fase.id)
        elif case=='criterio':
            element = CriterioDeProducto.objects.get(id=id_registro)
            proyecto = element.producto.fase.proyecto
            breadcrumbnav =[
                {'name': 'Inicio', 'link':'/administrar/inicio'},
                {'name':'Fases','link':'/administrar/proyecto/'+str(element.producto.fase.proyecto.id)},
                {'name':element.producto.fase,'link':'/administrar/proyecto/fase/'+str(element.producto.fase.id)},
                {'name':element.producto,'link':'/administrar/proyecto/fase/producto/'+str(element.producto.id)},
                {'name':'Eliminar'}
            ]
    	    previous_url = "/administrar/proyecto/fase/producto/"+str(element.producto.id)
        elif case=='metrica':
            element = MetricaDeProducto.objects.get(id=id_registro)
            proyecto = element.producto.fase.proyecto
            breadcrumbnav =[
                {'name': 'Inicio', 'link':'/administrar/inicio'},
                {'name':'Fases','link':'/administrar/proyecto/'+str(element.producto.fase.proyecto.id)},
                {'name':element.producto.fase,'link':'/administrar/proyecto/fase/'+str(element.producto.fase.id)},
                {'name':element.producto,'link':'/administrar/proyecto/fase/producto/'+str(element.producto.id)},
                {'name':'Eliminar'}
            ]
    	    previous_url = "/administrar/proyecto/fase/producto/"+str(element.producto.id)
        if proyecto.estatus:
            errors.append('No se puede eliminar, el proyecto se encuentra en revision, cambie en estatus del proyecto.')
            context = {'breadcrumbnav':breadcrumbnav,'errors':errors}
            return render (request, 'inicio/eliminar.html', context)
    except ObjectDoesNotExist: # Query doesnt mach any item
        errors.append('Elemento no encontrado!')
        context = {'breadcrumbnav':breadcrumbnav,'errors':errors}
        return render (request, 'inicio/eliminar.html', context)
    except Exception as e: # Case worong id or another error like email error
        errors.append('Ocurrio un error!')
        context = {'breadcrumbnav':breadcrumbnav,'errors':errors}
        return render (request, 'inicio/eliminar.html', context)
    if request.method == 'POST' and not proyecto.estatus:
        if request.POST.get("eliminar"):
            if case=='proyecto':
                element = Proyecto.objects.get(id=id_registro)
                if FaseDeProyecto.objects.filter(proyecto=element).count()>0:
                    errors.append('No se puede eliminar un proyecto con fases asignadas.')
                else:
                    element.delete()
                    return HttpResponseRedirect("/administrar/inicio/")
            elif case=='fase':
                if ProductoDeTrabajoDeFase.objects.filter(fase=element).count()>0:
                    errors.append('No se puede eliminar una fase con productos de trabajo asignados.')
                else:
                    element.delete()
                    return HttpResponseRedirect("/administrar/proyecto/%s/" % element.proyecto.id)
            elif case=='evento':
                element.delete()
                return HttpResponseRedirect("/administrar/proyecto/eventos/%s/" % element.proyecto.id)
            elif case=='rol':
                element.delete()
                return HttpResponseRedirect("/administrar/proyecto/roles/%s/" % element.proyecto.id)
            elif case=='producto':
                if CriterioDeProducto.objects.filter(producto=element).count()>0:
                    errors.append('No se puede eliminar un producto de fase con criterios asignados.')
                elif MetricaDeProducto.objects.filter(producto=element).count()>0:
                    errors.append('No se puede eliminar un producto de fase con métricas asignadas.')
                else:
                    element.delete()
                    return HttpResponseRedirect("/administrar/proyecto/fase/%s/" % element.fase.id)
            else:
                element.delete()
                return HttpResponseRedirect("/administrar/proyecto/fase/producto/%s/" % element.producto.id)
    context = {'element':element, 'breadcrumbnav':breadcrumbnav, 'errors':errors, 'previous_url':previous_url}
    return render (request, 'inicio/eliminar.html', context)

@login_required(login_url='/login/')
def obtener_metricas_asociadas(request):
    if request.method == 'GET':
        try:
            id_metrica = parse_int(request.GET.get('id_metrica'))
            metrica = Metrica.objects.get(pk=id_metrica, tipo='I')
            if metrica.metricas_relacionadas.count() > 0:
                metricas_relacionadas = [metrica.nombre for metrica in metrica.metricas_relacionadas.all()]
                return JsonResponse({'success':True, 'metricas':metricas_relacionadas})
        except Exception as e:
            return JsonResponse({'success':False, 'metricas':False, 'e':str(e)})
            pass
    return JsonResponse({'success':False, 'metricas':False})

def notifyPasswordToken(request, user, token):
    try:
        title = u" Actualización de contraseña en cuenta"
        body = u"Se ha solicitado una recuperación de su cuenta.<br>"
        body += "Copie y pegue el siguiente link en su navegador: http://"+str(request.META['HTTP_HOST'])+"/recover/token/"+token
        body += '<br>'
        body += 'Atentamente:<br>'
        body += 'SQATOOL<br>'
        body += '**Este mensaje es autogenerado, no responda a este correo.'
        receiver = [user.email]
        return sendMail(title,body,receiver)
    except Exception as e:
        raise e
        return False

def notifyEvent(request, eventoDeProyecto, action):
    try:
        title = eventoDeProyecto.proyecto.nombre+" - Eventos"
        body = ""
        if action=="DELETE":
            body = "Se a eliminado un evento con los siguientes datos: <br>"
        elif action=="ADD":
            body = "Se a registrado un nuevo con los siguientes datos: <br>"
        body += "Tipo de evento : "+eventoDeProyecto.evento.nombre+" <br>"
        body += "Fecha : "+str(eventoDeProyecto.fecha)+" <br>"
        body += "Hora : "+str(eventoDeProyecto.hora)+" <br>"
        body += '<br>'
        body += 'Atentamente:<br>'
        body += 'SQATOOL<br>'
        body += '**Este mensaje es autogenerado, no responda a este correo.'
        receiver = [asistente.email for asistente in eventoDeProyecto.asistentes.all()]
        return sendMail(title,body,receiver)
    except Exception as e:
        return False

def notifyRol(request, rolDeProyecto, event):
    try:
        title = rolDeProyecto.proyecto.nombre+" - Roles"
        body = "Hola "+rolDeProyecto.usuario.first_name+":<br>"
        body = "Se a agregado o actualizado el proyecto "+rolDeProyecto.proyecto.nombre+" :<br>"
        if event == "DELETE":
            body += 'Se a eliminado su rol como '+rolDeProyecto.rol.nombre+" en el proyecto "+rolDeProyecto.proyecto.nombre+" "
        elif event == "ADD":
            body += 'Se a registrado el rol '+rolDeProyecto.rol.nombre+" en el proyecto "+rolDeProyecto.proyecto.nombre+" "
        body += 'para revisar los productos de trabajo a evaluar, ve al siguiente '
        body += '<a href="'+str(request.META['HTTP_HOST'])+'/evaluar/inicio">link</a> o pege el siguiente enlace en el navegador: '+str(request.META['HTTP_HOST'])+'/evaluar/inicio,'
        body += ' en el apareceran las fases registradas disponibles <br>'
        body += '<br>'
        body += 'Atentamente:<br>'
        body += 'SQATOOL<br>'
        body += '**Este mensaje es autogenerado, no responda a este correo.'
        receiver = [rolDeProyecto.usuario.email]
        return sendMail(title,body,receiver)
    except Exception as e:
        return False

def sendMail(title='', body='', receiver=['saul.ibarra@cimat.mx']):
    email = EmailMessage(title, body, to=receiver)
    email.content_subtype = "html"
    return email.send()

def check_project(proyecto):
    messages = []
    try:
        # to chech atleast one stage
        fases_de_proyecto = FaseDeProyecto.objects.filter(proyecto=proyecto)
        if fases_de_proyecto.count() == 0:
            messages.append('No tiene fases agregadas, registre las fases de acuerdo a su plan de proyecto.')
        # to chech roles acording to project stages
        fases = Fase.objects.filter(pk__in=[fase_de_proyecto.fase.id for fase_de_proyecto in fases_de_proyecto])
        roles_id=[]
        for fase in fases:
            roles_id += [rol.id for rol in fase.roles.all()] #roles necesarios para el proyecto
        roles_necesarios = Rol.objects.filter(pk__in =roles_id)
        for rol in roles_necesarios:
            #verifica que cada rol necesario este agregado al proyecto
            if RolDeProyecto.objects.filter(proyecto=proyecto, rol=rol).count()==0:
                messages.append('Falta asignar el rol de '+rol.nombre+' en el proyecto.')
        for fase_de_proyecto in fases_de_proyecto:
            # to chech atleast one work product by each stage
            productos_de_fase = ProductoDeTrabajoDeFase.objects.filter(fase=fase_de_proyecto)
            if productos_de_fase.count() == 0:
                messages.append('Falta agregar productos de trabajo en la fase '+fase_de_proyecto.fase.nombre+" que comienza el "+fase_de_proyecto.fecha_de_inicio.strftime('%d-%m-%Y'))
            for producto_de_fase in productos_de_fase:
                # to chech atleast one work product aceptance criteria
                criterios_de_producto = CriterioDeProducto.objects.filter(producto=producto_de_fase)
                if criterios_de_producto.count() == 0:
                    messages.append('El producto de trabajo: '+producto_de_fase.producto.nombre+', agregado en la fase de '+fase_de_proyecto.fase.nombre+' no tiene criterios asignados.')
                # to chech atleast one work product metric
                metricas_de_producto = MetricaDeProducto.objects.filter(producto=producto_de_fase)
                if metricas_de_producto.count() == 0 and producto_de_fase.producto.nombre != 'Documento de cierre de proyecto':
                    messages.append('El producto de trabajo: '+producto_de_fase.producto.nombre+', agregado en la fase de '+fase_de_proyecto.fase.nombre+u' no tiene métricas asociadas.')
    except Exception as e:
        messages.append('Hay un problema con su proyecto, no se pudieron verificar las fases.'+str(e))
    return messages

def parse_int(int_var):
    try:
        return int(int_var)
    except Exception as e:
        raise e
