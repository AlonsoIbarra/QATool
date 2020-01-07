# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.test import TestCase
from django.utils.crypto import get_random_string
from django.contrib.auth.models import User, Permission
from models import *
from django.utils import timezone
import time

# Create your tests here.
class LoginTest(TestCase):

    def setUp(self):
        User.objects.create_user('testuser', 'test@gmail.com', 'test')
        self.user = User.objects.get(username='testuser')

    #UTI0
    def test_authenticar(self):
        self.assertTrue(self.user.is_authenticated)

class ProyectoTest(TestCase):

    def setUp(self):
        User.objects.create_user('user', 'user@gmail.com', 'user')
        self.user = User.objects.get(username='testuser')

    #UTI1
    def test_manipular_proyectos(self):
        np = Proyecto()
        np.nombre = 'Proyecto 1' 
        np.cliente = 'Cliente 1'
        np.nombre_del_equipo = 'Equipo 1'
        np.metodologia = 'Metodología'
        np.usuario_registro_id = self.user.id
        np.save()
        rows = Proyecto.objects.count()
        self.assertEqual(1, rows)
        ps = Proyecto.objects.get(id=np.id)
        ps.nombre = 'Nuevo nombre proyecto'
        ps.save()
        pr = Proyecto.objects.get(nombre='Nuevo nombre proyecto')
        self.assertEqual(ps, pr)
        Proyecto.objects.filter(id=ps.id).delete()
        rows = Proyecto.objects.count()
        self.assertEqual(0, rows)

        np = Proyecto()
        np.nombre = 'Proyecto 1' 
        np.cliente = 'Cliente 1'
        np.nombre_del_equipo = 'Equipo 1'
        np.metodologia = 'Metodología'
        np.usuario_registro_id = self.user.id
        np.save()
        np2 = Proyecto()
        np2.nombre = 'Proyecto 2' 
        np2.cliente = 'Cliente 2'
        np2.nombre_del_equipo = 'Equipo 2'
        np2.metodologia = 'Metodología'
        np2.usuario_registro_id = self.user.id
        np2.save()
        p = Proyecto()
        p.nombre = 'Proyecto 3' 
        p.cliente = 'Cliente 3'
        p.nombre_del_equipo = 'Equipo 3'
        p.metodologia = 'Metodología'
        p.usuario_registro_id = self.user.id
        p.save()

        proyectos = Proyecto.objects.count()
        self.assertEqual(3, proyectos)

    #UTI2
    def test_manipular_roles(self):
        nr = Rol()
        nr.nombre = "asasas"
        nr.descripcion = "sdasdasdasd"
        nr.save()
        rows = Rol.objects.count()
        self.assertEqual(1, rows)
        rs = Rol.objects.get(nombre="asasas")
        rs.nombre = 'Nuevo nombre'
        rs.save()
        nr = Rol.objects.get(nombre="Nuevo nombre")
        self.assertEqual(rs.nombre,nr.nombre)
        Rol.objects.filter(nombre="Nuevo nombre").delete()
        rows = Rol.objects.count()
        self.assertEqual(0, rows)
        nr = Rol()
        nr.nombre = "asasas"
        nr.descripcion = "sdasdasdasd"
        nr.save()
        rows = Rol.objects.count()
        self.assertEqual(1, rows)

    #UTI3
    def test_agregar_fases(self):
        nf = Fase()
        nf.nombre = 'Analisis'
        nf.objetivo = 'Praesent tincidunt facilisis bibendum. Aenean quis massa fringilla, rhoncus sem nec, porta diam. In quis est non nisl tempor iaculis. Quisque vitae arcu in metus pretium aliquam a tempor nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras lacinia efficitur ex non vehicula. Duis ex mauris, cursus sit amet placerat at, pellentesque at diam. In nec nunc ut neque dapibus tempus. Cras consequat luctus ex at laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc ut erat eros. Maecenas malesuada diam vel urna sollicitudin, quis dapibus diam commodo. Suspendisse elit tellus, suscipit nec ipsum in, egestas ultrices est. Quisque vitae nisl sagittis enim vulputate laoreet id eget arcu. Vivamus accumsan nec mi vel varius. Morbi elementum tellus et sollicitudin ullamcorper.'
        nf.save()
        rows = Fase.objects.count()
        self.assertEqual(1, rows)
        nf1 = Fase()
        nf1.nombre = 'Codificación'
        nf1.objetivo = 'Praesent tincidunt facilisis bibendum. Aenean quis massa fringilla, rhoncus sem nec, porta diam. In quis est non nisl tempor iaculis. Quisque vitae arcu in metus pretium aliquam a tempor nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras lacinia efficitur ex non vehicula. Duis ex mauris, cursus sit amet placerat at, pellentesque at diam. In nec nunc ut neque dapibus tempus. Cras consequat luctus ex at laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc ut erat eros. Maecenas malesuada diam vel urna sollicitudin, quis dapibus diam commodo. Suspendisse elit tellus, suscipit nec ipsum in, egestas ultrices est. Quisque vitae nisl sagittis enim vulputate laoreet id eget arcu. Vivamus accumsan nec mi vel varius. Morbi elementum tellus et sollicitudin ullamcorper.'
        nf1.save()
        rows = Fase.objects.count()
        self.assertEqual(2, rows)
        nf2 = Fase()
        nf2.nombre = 'Pruebas'
        nf2.objetivo = 'Praesent tincidunt facilisis bibendum. Aenean quis massa fringilla, rhoncus sem nec, porta diam. In quis est non nisl tempor iaculis. Quisque vitae arcu in metus pretium aliquam a tempor nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras lacinia efficitur ex non vehicula. Duis ex mauris, cursus sit amet placerat at, pellentesque at diam. In nec nunc ut neque dapibus tempus. Cras consequat luctus ex at laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc ut erat eros. Maecenas malesuada diam vel urna sollicitudin, quis dapibus diam commodo. Suspendisse elit tellus, suscipit nec ipsum in, egestas ultrices est. Quisque vitae nisl sagittis enim vulputate laoreet id eget arcu. Vivamus accumsan nec mi vel varius. Morbi elementum tellus et sollicitudin ullamcorper.'
        nf2.save()
        rows = Fase.objects.count()
        self.assertEqual(3, rows)

    #UTI4
    def test_agregar_estatus_de_productos(self):
        ne = EstatusDeProductos()
        ne.valor = 1
        ne.nombre = 'Agregado sin revisar'
        ne.descripcion = 'rhoncus sem nec, porta diam. In quis est non ni.'
        ne.save()
        estatus = EstatusDeProductos.objects.all().count()
        self.assertEqual(1, estatus)

        ne = EstatusDeProductos()
        ne.valor = 2
        ne.nombre = 'Verificado'
        ne.descripcion = 'rhoncus sem nec, porta diam. In quis est non ni.'
        ne.save()
        estatus = EstatusDeProductos.objects.all().count()
        self.assertEqual(2, estatus)

    #UTI5
    def test_agregar_productos(self):
        npd = ProductoDeTrabajo()
        npd.nombre = 'Codigo'
        npd.descripcion = 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras lacinia efficitur ex non vehicula. Duis ex mauris, cursus sit amet placerat at, pellentesque at diam. In nec nunc ut neque dapibus tempus. Cras consequat luctus ex at laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc ut erat eros. Maecenas malesuada diam vel urna sollicitudin, quis dapibus diam commodo. Suspendisse elit tellus, suscipit nec ipsum in, egestas ultrices est. Quisque vitae nisl sagittis enim vulputate laoreet id eget arcu. Vivamus accumsan nec mi vel varius. Morbi elementum tellus et sollicitudin ullamcorper.'
        npd.save()
        productos = ProductoDeTrabajo.objects.all().count()
        npd2 = ProductoDeTrabajo()
        npd2.nombre = 'Codigo'
        npd2.descripcion = 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras lacinia efficitur ex non vehicula. Duis ex mauris, cursus sit amet placerat at, pellentesque at diam. In nec nunc ut neque dapibus tempus. Cras consequat luctus ex at laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc ut erat eros. Maecenas malesuada diam vel urna sollicitudin, quis dapibus diam commodo. Suspendisse elit tellus, suscipit nec ipsum in, egestas ultrices est. Quisque vitae nisl sagittis enim vulputate laoreet id eget arcu. Vivamus accumsan nec mi vel varius. Morbi elementum tellus et sollicitudin ullamcorper.'
        npd2.save()
        productos = ProductoDeTrabajo.objects.all().count()
        self.assertEqual(2, productos)

    #UTI6
    def test_agregar_criterios(self):
        ca1 = CriterioDeAceptacion()
        ca1.nombre = 'Criterio 1'
        ca1.descripcion = 'Descripcion de criterio'
        ca1.tipo = 'tipo 1'
        ca1.save()
        ca2 = CriterioDeAceptacion()
        ca2.nombre = 'Criterio 2'
        ca2.descripcion = 'Descripcion de criterio'
        ca2.tipo = 'tipo 2'
        ca2.save()
        criterios_registrados = CriterioDeAceptacion.objects.all().count()
        self.assertEqual(2, criterios_registrados)

    #UTI7
    def test_agregar_fases_a_proyecto(self):
        np = Proyecto()
        np.nombre = 'Proyecto 1' 
        np.cliente = 'Cliente 1'
        np.nombre_del_equipo = 'Equipo 1'
        np.metodologia = 'Metodología'
        np.usuario_registro_id = self.user.id
        np.save()
        nf = Fase()
        nf.nombre = 'Analisis'
        nf.objetivo = 'Praesent tincidunt facilisis bibendum. Aenean quis massa fringilla, rhoncus sem nec, porta diam. In quis est non nisl tempor iaculis. Quisque vitae arcu in metus pretium aliquam a tempor nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras lacinia efficitur ex non vehicula. Duis ex mauris, cursus sit amet placerat at, pellentesque at diam. In nec nunc ut neque dapibus tempus. Cras consequat luctus ex at laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc ut erat eros. Maecenas malesuada diam vel urna sollicitudin, quis dapibus diam commodo. Suspendisse elit tellus, suscipit nec ipsum in, egestas ultrices est. Quisque vitae nisl sagittis enim vulputate laoreet id eget arcu. Vivamus accumsan nec mi vel varius. Morbi elementum tellus et sollicitudin ullamcorper.'
        nf.save()
        nf = FaseDeProyecto()
        nf.fase_id = Fase.objects.get(id=1).id
        nf.proyecto_id = Proyecto.objects.get(id=1).id
        nf.fecha_de_inicio = time.strftime("%Y-%m-%d")
        nf.fecha_de_cierre = time.strftime("%Y-%m-%d")
        nf.save()
        rows = FaseDeProyecto.objects.filter(proyecto_id=1).count()
        self.assertEqual(1, rows)

    #UTI8
    def test_agregar_productos_a_fase(self):
        np = Proyecto()
        np.nombre = 'Proyecto 1' 
        np.cliente = 'Cliente 1'
        np.nombre_del_equipo = 'Equipo 1'
        np.metodologia = 'Metodología'
        np.usuario_registro_id = self.user.id
        np.save()
        nf = Fase()
        nf.nombre = 'Analisis'
        nf.objetivo = 'Praesent tincidunt facilisis bibendum. Aenean quis massa fringilla, rhoncus sem nec, porta diam. In quis est non nisl tempor iaculis. Quisque vitae arcu in metus pretium aliquam a tempor nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras lacinia efficitur ex non vehicula. Duis ex mauris, cursus sit amet placerat at, pellentesque at diam. In nec nunc ut neque dapibus tempus. Cras consequat luctus ex at laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc ut erat eros. Maecenas malesuada diam vel urna sollicitudin, quis dapibus diam commodo. Suspendisse elit tellus, suscipit nec ipsum in, egestas ultrices est. Quisque vitae nisl sagittis enim vulputate laoreet id eget arcu. Vivamus accumsan nec mi vel varius. Morbi elementum tellus et sollicitudin ullamcorper.'
        nf.save()
        nf1 = FaseDeProyecto()
        nf1.fase_id = Fase.objects.get(id=1).id
        nf1.proyecto_id = Proyecto.objects.get(id=1).id
        nf1.fecha_de_inicio = time.strftime("%Y-%m-%d")
        nf1.fecha_de_cierre = time.strftime("%Y-%m-%d")
        nf1.save()
        fases = FaseDeProyecto.objects.all().count()
        self.assertEqual(1, fases)

class ProyectoTest(TestCase):

    #UTI9
    def setUp(self):
        User.objects.create_user('user', 'user@gmail.com', 'user')
        self.user = User.objects.get(username='user')
        Proyecto.objects.create(nombre="Lorem", cliente="ipsum",nombre_del_equipo='Lorem',metodologia='ipsum',usuario_registro_id=self.user.id)
        Fase.objects.create(nombre="Lorem", objetivo="ipsum", permiso_de_fase=Permission.objects.get(pk=1))
        Fase.objects.create(nombre="ipsum", objetivo="Lorem", permiso_de_fase=Permission.objects.get(pk=2))
        Metrica.objects.create(nombre='Lorem',descripcion='ipsum')
        ProductoDeTrabajo.objects.create(nombre='Lorem',descripcion='ipsum')
        ProductoDeTrabajo.objects.create(nombre='ipsum',descripcion='Lorem')
        CriterioDeAceptacion.objects.create(nombre='Lorem',descripcion='ipsum',tipo='Lorem')
        CriterioDeAceptacion.objects.create(nombre='ipsum',descripcion='Lorem',tipo='ipsum')
        EstatusDeProductos.objects.create(valor = 0,nombre = 'Agregado sin revisar',descripcion='Lorem ipsum')
        EstatusDeProductos.objects.create(valor = 1,nombre = 'Agregado revisado',descripcion='Lorem ipsum')
        EstatusDeProductos.objects.create(valor = 2,nombre = 'Revisado',descripcion='Lorem ipsum')
        FaseDeProyecto.objects.create(proyecto = Proyecto.objects.get(nombre='Lorem'),fase = Fase.objects.get(nombre='Lorem'), fecha_de_inicio = time.strftime("%Y-%m-%d"), fecha_de_cierre = time.strftime("%Y-%m-%d"))
        Evento.objects.create(nombre='Reunion',descripcion='Lorem ipsum')

    #UTI10
    def test_agregar_productos_a_fase(self):
        proyecto = Proyecto.objects.get(nombre='Lorem')
        pf1 = ProductoDeTrabajoDeFase()
        pf1.producto_id = ProductoDeTrabajo.objects.get(nombre='Lorem').id
        pf1.fase_id = FaseDeProyecto.objects.get(proyecto=proyecto).id
        pf1.estatus_id = EstatusDeProductos.objects.get(valor=1).id
        pf1.save()
        productos_de_fase = ProductoDeTrabajoDeFase.objects.all().count()
        self.assertEqual(1, productos_de_fase)

    #UTI11
    def test_asignar_criterios_a_producto(self):
        pf1 = ProductoDeTrabajoDeFase()
        pf1.producto_id = ProductoDeTrabajo.objects.get(nombre='Lorem').id
        pf1.fase_id = FaseDeProyecto.objects.get(fase = Fase.objects.get(nombre='Lorem')).id
        pf1.estatus_id = EstatusDeProductos.objects.get(valor=1).id
        pf1.save()

        cp1 = CriterioDeProducto()
        cp1.producto = pf1
        cp1.criterio = CriterioDeAceptacion.objects.get(nombre='Lorem')
        cp1.save()
        cp2 = CriterioDeProducto()
        cp2.producto = pf1
        cp2.criterio = CriterioDeAceptacion.objects.get(nombre='ipsum')
        cp2.save()
        criterios_registrados = CriterioDeProducto.objects.filter(producto=pf1.id).count()
        self.assertEqual(2, criterios_registrados)

    #UTI12
    def test_agregar_eventos_de_proyecto(self):
        p = Proyecto.objects.get(nombre='Lorem')
        ep = EventoDeProyecto()
        ep.evento = Evento.objects.get(id=1)
        ep.proyecto = p
        ep.fecha = timezone.now()
        ep.hora = timezone.now()
        ep.save()
        eventos_de_proyecto = EventoDeProyecto.objects.filter(proyecto=p).count()
        self.assertEqual(1, eventos_de_proyecto)


    #UTI13
    def test_asignar_metricas_a_producto(self):
        pt = ProductoDeTrabajoDeFase()
        pt.producto=ProductoDeTrabajo.objects.get(nombre='Lorem')
        pt.fase=FaseDeProyecto.objects.get(proyecto=Proyecto.objects.get(nombre='Lorem'))
        pt.estatus=EstatusDeProductos.objects.get(nombre = 'Agregado sin revisar')
        pt.metricas = Metrica.objects.filter(pk__in=[4])
        pt.save()
        metricas_asignadas = pt.metricas.count()
        self.assertEqual(1, metricas_asignadas)
