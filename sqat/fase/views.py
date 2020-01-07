# -*- coding: utf-8 -*-
from django.contrib.auth.decorators import login_required
from django.http import Http404, HttpResponseRedirect, JsonResponse
from django.shortcuts import render
#from django.template import Context, loader
from django.shortcuts import render_to_response
from django.db.models import Q
from FaseForms import *
from inicio.models import *
import datetime

@login_required(login_url='/login/')
def inicio(request):
    try:
        id_usuario = parse_int(request.user.id)
        roles = RolDeProyecto.objects.filter(usuario=id_usuario)
        proyectos_allowed = [rol.proyecto.id for rol in roles]
        proyectos = Proyecto.objects.filter(Q(estatus=True) & (Q(pk__in=proyectos_allowed) | Q(usuario_registro=request.user)))
    except Exception as e:
        return HttpResponseRedirect("/evaluar/inicio/")
    breadcrumbnav = []
    context = {'proyectos':proyectos, 'breadcrumbnav':breadcrumbnav}
    return render(request, 'fase/index.html', context)

@login_required(login_url='/login/')
def fases_de_proyecto(request, id_proyecto):
    try:
        id_proyecto = parse_int(id_proyecto)
        id_usuario = parse_int(request.user.id)
        proyecto = Proyecto.objects.get(Q(pk=id_proyecto) & Q(estatus=True))
        roles_de_usuario = RolDeProyecto.objects.filter(proyecto=proyecto, usuario=id_usuario)
        roles_id_list = [rol_de_usuario.rol.id for rol_de_usuario in roles_de_usuario]
        fases_de_usuario = Fase.objects.filter(roles__in = roles_id_list)
        fases_id_list = [fase_de_usuario.id for fase_de_usuario in fases_de_usuario]
        fases_de_proyecto = FaseDeProyecto.objects.filter(proyecto=id_proyecto, fase__in=fases_id_list)
    except Exception as e:
        return HttpResponseRedirect("/evaluar/inicio/")
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/evaluar/inicio'},
        {'name': 'Fases'}
    ]
    context = {'proyecto':proyecto, 'fases':fases_de_proyecto, 'breadcrumbnav':breadcrumbnav}
    return render(request, 'fase/fases.html', context)

@login_required(login_url='/login/')
def revisar_fase(request, id_fase):
    try:
        id_fase = parse_int(id_fase)
        fase = FaseDeProyecto.objects.get(id=id_fase)
        productos_de_trabajo = ProductoDeTrabajoDeFase.objects.filter(fase=id_fase)
        updateFileAllowed = request.user.has_perm('inicio.'+fase.fase.permiso_de_fase.codename)
        #verificar si tiene permiso de actualizar archivo para este proyecto
        updateFileAllowed = PermisoDeUsuario.objects.filter(proyecto=fase.proyecto.id,usuario=request.user.id,permiso=fase.fase.permiso_de_fase.id).count()
        if not fase.proyecto.estatus:
            HttpResponseRedirect("/evaluar/inicio/")
    except Exception as e:
        HttpResponseRedirect("/evaluar/inicio/")
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/evaluar/inicio'},
        {'name': 'Fases', 'link': '/evaluar/proyecto/'+str(fase.proyecto.id)+"/"},
        {'name': fase}
    ]
    rol = Rol.objects.get(pk=2)
    context = {'rol':rol, 'fase':fase, 'productos_de_trabajo':productos_de_trabajo, 'breadcrumbnav':breadcrumbnav, 'updateFileAllowed':updateFileAllowed}
    return render(request, 'fase/productos.html', context)

@login_required(login_url='/login/')
def actualizar_producto(request, id_producto_de_fase):
    try:
        id_producto_de_fase = parse_int(id_producto_de_fase)
        producto_de_fase = ProductoDeTrabajoDeFase.objects.get(id=id_producto_de_fase)
        producto_de_fase.ultima_actualizacion= datetime.datetime.now()
        fase_proyecto = FaseDeProyecto.objects.get(id=producto_de_fase.fase.id)
    except Exception as e:
        raise Http404()
    if request.method == 'POST':
        form = FormularioActualizarProductoDeTrabajo(request.POST, request.FILES, instance=producto_de_fase)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/evaluar/fase/%s/" % producto_de_fase.fase.id)
    else:
        form = FormularioActualizarProductoDeTrabajo(instance=producto_de_fase)
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/evaluar/inicio'},
        {'name': 'Fases', 'link': '/evaluar/proyecto/'+str(fase_proyecto.proyecto.id)},
        {'name': fase_proyecto, 'link': '/evaluar/fase/'+str(fase_proyecto.id)},
        {'name': 'Actualizar archivo'}
    ]
    context = {'form':form, 'object':fase_proyecto, 'breadcrumbnav':breadcrumbnav}
    return render (request, 'inicio/agregar.html', context)

@login_required(login_url='/login/')
def aprobar_criterios_de_producto(request, id_producto_de_fase):
    try:
        id_producto_de_fase = parse_int(id_producto_de_fase)
        producto_de_fase = ProductoDeTrabajoDeFase.objects.get(id=id_producto_de_fase)
        fase_proyecto = FaseDeProyecto.objects.get(id=producto_de_fase.fase.id)
        if not fase_proyecto.proyecto.estatus:
            HttpResponseRedirect("/evaluar/inicio/")
    except Exception as e:
        raise Http404()
    if request.method == 'POST':
        form = FormularioAprobarCriteriosProductoDeTrabajo(request.POST, instance=producto_de_fase)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/evaluar/producto/criterios/%s/" % producto_de_fase.id)
    else:
        form = FormularioAprobarCriteriosProductoDeTrabajo(instance=producto_de_fase)
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/evaluar/inicio'},
        {'name': 'Fases', 'link': '/evaluar/proyecto/'+str(fase_proyecto.proyecto.id)},
        {'name': fase_proyecto, 'link': '/evaluar/fase/'+str(fase_proyecto.id)},
        {'name': producto_de_fase.producto.nombre, 'link': '/evaluar/producto/criterios/'+str(producto_de_fase.id)},
        {'name': 'Aprobar criterios'}
    ]
    messages=['Una vez confirmados los criterios no se permitirá actualizarlos.']
    context = {'form':form, 'object':fase_proyecto, 'breadcrumbnav':breadcrumbnav, 'messages':messages, 'previous_url': '/evaluar/producto/criterios/'+str(producto_de_fase.id)}
    return render (request, 'inicio/agregar.html', context)

@login_required(login_url='/login/')
def revisar_criterios(request, id_producto_de_fase):
    try:
        id_producto_de_fase = parse_int(id_producto_de_fase)
        producto_de_trabajo = ProductoDeTrabajoDeFase.objects.get(id=id_producto_de_fase)
        criterios = CriterioDeProducto.objects.filter(producto=producto_de_trabajo)
        #verificar si tiene permiso de actualizar archivo para este proyecto
        allowVerification = PermisoDeUsuario.objects.filter(proyecto=producto_de_trabajo.fase.proyecto.id, usuario=request.user.id, permiso=21).count() #can_update_product_criteria
        allowValidation = PermisoDeUsuario.objects.filter(proyecto=producto_de_trabajo.fase.proyecto.id, usuario=request.user.id, permiso=20).count() # can_commit_aceptance_criteria
        #raise ValueError(str('A very specific bad thing happened'))
        #raise ValueError(allowVerification)
        if not producto_de_trabajo.fase.proyecto.estatus:
            HttpResponseRedirect("/evaluar/inicio/")
    except Exception as e:
        return e
        #HttpResponseRedirect("/evaluar/inicio/")
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/evaluar/inicio'},
        {'name': 'Fases', 'link': '/evaluar/proyecto/'+str(producto_de_trabajo.fase.proyecto.id)+"/"},
        {'name': producto_de_trabajo.fase, 'link':'/evaluar/fase/'+str(producto_de_trabajo.fase.id)+"/"},
        {'name': producto_de_trabajo}
    ]
    #allowed = revisar_permiso(request.user, producto_de_trabajo.fase.fase)
    context = {'producto_de_trabajo':producto_de_trabajo, 'criterios':criterios, 'breadcrumbnav':breadcrumbnav, 'allowVerification':allowVerification, 'allowValidation':allowValidation}
    return render(request, 'fase/criterios.html', context)

@login_required(login_url='/login/')
def revisar_metricas(request, id_producto_de_fase):
    try:
        metricasList = []
        id_producto_de_fase = parse_int(id_producto_de_fase)
        producto_de_trabajo = ProductoDeTrabajoDeFase.objects.get(id=id_producto_de_fase)
        metricas = MetricaDeProducto.objects.filter(producto=producto_de_trabajo)
        if not producto_de_trabajo.fase.proyecto.estatus:
            HttpResponseRedirect("/evaluar/inicio/")
    except Exception as e:
        return HttpResponseRedirect("/evaluar/inicio/")
    breadcrumbnav = [
        {'name': 'Inicio', 'link': '/evaluar/inicio'},
        {'name': 'Fases', 'link': '/evaluar/proyecto/'+str(producto_de_trabajo.fase.proyecto.id)+"/"},
        {'name': producto_de_trabajo.fase, 'link':'/evaluar/fase/'+str(producto_de_trabajo.fase.id)+"/"},
        {'name': producto_de_trabajo}
    ]
    for metrica in metricas:
        if isUpdated(request, metrica):
            metricasList.append({'metrica':metrica,'form':FormularioMetrica(initial={'metrica': metrica})})
        else:
            metricasList.append({'metrica':metrica})
    context = {'producto_de_trabajo':producto_de_trabajo, 'metricasList':metricasList, 'breadcrumbnav':breadcrumbnav}
    return render(request, 'fase/metricas.html', context)

@login_required(login_url='/login/')
def isUpdated(request, metrica_de_producto):
    if metrica_de_producto.metrica.tipo=='M':
        datosActuales = HistoricoDeMetrica.objects.filter(metrica=metrica_de_producto,fecha=datetime.datetime.now())
        if datosActuales.count()==0:
            return True
    elif metrica_de_producto.metrica.tipo=='I':
        metricas_relacionadas = metrica_de_producto.metrica.metricas_relacionadas.all()
        for metrica in metricas_relacionadas:
            metrica_de_producto_relacionada = MetricaDeProducto.objects.get(producto=metrica_de_producto.producto,metrica=metrica)
            datosActuales = HistoricoDeMetrica.objects.filter(metrica=metrica_de_producto_relacionada,fecha=datetime.datetime.now())
            if datosActuales.count()==0:
                return False
            # data avariable
        update(metrica_de_producto)
    return False

def update(metrica_de_producto):
    try:
        if metrica_de_producto.metrica.codigo == 'GVR':
            numero_de_requisitos = Metrica.objects.get(codigo='NR')
            metrica_de_producto_relacionada1 = MetricaDeProducto.objects.get(metrica=numero_de_requisitos,producto=metrica_de_producto.producto.id)
            requisitos = HistoricoDeMetrica.objects.get(metrica=metrica_de_producto_relacionada1,fecha=datetime.datetime.now())
            requisitos_validados = Metrica.objects.get(codigo='NRV')
            metrica_de_producto_relacionada2 = MetricaDeProducto.objects.get(metrica=requisitos_validados,producto=metrica_de_producto.producto.id)
            requisitos_validados = HistoricoDeMetrica.objects.get(metrica=metrica_de_producto_relacionada2,fecha=datetime.datetime.now())
            gvr = requisitos_validados.dato * 100 / requisitos.dato
            hm = HistoricoDeMetrica()
            hm.metrica = metrica_de_producto
            hm.dato = gvr
            hm.fecha = datetime.datetime.now()
            hm.save()
    except Exception as e:
        return False

@login_required(login_url='/login/')
def actualizar_criterio(request):
    if request.method == 'GET':
        try:
            id_criterio = parse_int(request.GET.get('id_criterio'))
            value = request.GET.get('value')
            cr = CriterioDeProducto.objects.get(id=id_criterio)
        except Exception as e:
            return JsonResponse({'success':False, 'value':False})
        if value in ("yes", "true", "True", "t", "1"):
            cr.estatus = True
        else:
            cr.estatus = False
        cr.save()
        return JsonResponse({'success':True, 'value':cr.estatus})
    pass

@login_required(login_url='/login/')
def agregar_accion_de_metrica(request):
    if request.method == 'GET':
        try:
            id_metrica = parse_int(request.GET.get('id_metrica'))
            accion = request.GET.get('accion')
            id_responsable = parse_int(request.GET.get('id_responsable'))
            fecha_limite = request.GET.get('fecha_limite')
            metricaDeProducto = MetricaDeProducto.objects.get(pk=id_metrica)
            responsable = User.objects.get(pk=id_responsable)
            accionMetrica = AccionCorrectivaDeMetrica()
            accionMetrica.metrica_de_producto = metricaDeProducto
            accionMetrica.accion = accion
            accionMetrica.responsable = responsable
            accionMetrica.fecha_limite = fecha_limite
            accionMetrica.save()
            return JsonResponse({'success':True, 'value':accionMetrica.id})
        except Exception as e:
            return JsonResponse({'success':False, 'value':str(e)})
    return JsonResponse({'success':False})

@login_required(login_url='/login/')
def cambiar_estatus_de_accion(request):
    if request.method == 'GET':
        try:
            id_accion = parse_int(request.GET.get('accion'))
            id_estatus = parse_int(request.GET.get('estatus'))
            estatus = EstatusDeAccionesCorrectivas.objects.get(pk=id_estatus)
            accionMetrica = AccionCorrectivaDeMetrica.objects.get(pk=id_accion)
            accionMetrica.estado = estatus
            accionMetrica.save()
            return JsonResponse({'success':True, 'value':accionMetrica.estado.id})
        except Exception as e:
            return JsonResponse({'success':False, 'value':str(e)})
    return JsonResponse({'success':False, 'value':'Nothing in get'})

@login_required(login_url='/login/')
def actualizar_metrica(request):
    if request.method == 'GET':
        try:
            id_metrica = parse_int(request.GET.get('id_metrica'))
            value = request.GET.get('value')
            metricaDeProducto = MetricaDeProducto.objects.get(id=id_metrica)
            historico = HistoricoDeMetrica()
            historico.metrica = metricaDeProducto
            historico.dato = abs(int(value))
            historico.save()
            return JsonResponse({'success':True, 'value':historico.id})
        except Exception as e:
            pass
    return JsonResponse({'success':False, 'value':str(e)})

def revisar_permiso(usuario, fase):
    try:
        roles_de_usuario = RolDeProyecto.objects.filter(usuario=usuario)
        roles_de_fase = fase.roles.all()
        lista = [rol for rol in roles_de_usuario if rol in roles_de_fase] #set(roles_de_usuario).intersection(roles_de_fase)
    except Exception as e:
        pass
    return False

@login_required(login_url='/login/')
def obtener_acciones_correctivas(request):
    if request.method == 'GET':
        try:
            id_metrica = parse_int(request.GET.get('id_metrica'))
            metrica = MetricaDeProducto.objects.get(pk=id_metrica)
            acciones_correctivas = AccionCorrectivaDeMetrica.objects.filter(metrica_de_producto=metrica)
            c = {'metrica': metrica, 'acciones_correctivas':acciones_correctivas}
            return render(request, 'fase/HistoricoAcciones.html', c) #JsonResponse({'success':True, 'data':html_list})
        except Exception as e:
            return render(request, str(e))
    return render(request, 'Sin datos disponibles.')

@login_required(login_url='/login/')
def agregar_accion_correctiva(request):
    if request.method == 'GET':
        try:
            id_metrica = parse_int(request.GET.get('id_metrica'))
            metrica = MetricaDeProducto.objects.get(pk=id_metrica)
            actionForm = FormularioAccionDeMetrica(initial={'metrica_de_producto': metrica.id})
            c = {'metrica': metrica, 'actionForm':actionForm}
            return render(request, 'fase/formAction.html', c)
        except Exception as e:
            return str(e)
    return 'Sin datos disponibles.'

@login_required(login_url='/login/')
def actualizar_observacion_de_accion(request):
    if request.method == 'GET':
        try:
            id_accion = parse_int(request.GET.get('id_accion'))
            observaciones = request.GET.get('observaciones')
            accion = AccionCorrectivaDeMetrica.objects.get(pk=id_accion)
            accion.observacion = observaciones
            accion.save()
            return JsonResponse({'success':True})
        except Exception as e:
            return JsonResponse({'success':False, 'error':str(e)})
    return JsonResponse({'success':False})

def parse_int(int_var):
    try:
        return int(int_var)
    except Exception as e:
        raise e
