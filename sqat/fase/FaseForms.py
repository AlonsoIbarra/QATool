# -*- coding: utf-8 -*-
from django.forms.extras.widgets import SelectDateWidget
from django import forms
from inicio.models import *
import datetime, time

class FormularioMetrica(forms.Form):
    metrica = forms.ModelChoiceField(queryset=MetricaDeProducto.objects.all())
    dato = forms.IntegerField(label='Resultado:')

    def __init__(self, *args, **kwargs):
        super(FormularioMetrica, self).__init__(*args, **kwargs)
        self.fields['metrica'].widget = forms.HiddenInput()

class FormularioAccionDeMetrica(forms.ModelForm):

    class Meta:
        model = AccionCorrectivaDeMetrica
        fields = ['metrica_de_producto', 'accion', 'responsable', 'fecha_limite']

    def __init__(self, *args, **kwargs):
        super(FormularioAccionDeMetrica, self).__init__(*args, **kwargs)
        self.fields['metrica_de_producto'].widget = forms.HiddenInput()
        self.fields['fecha_limite'].widget = SelectDateWidget()
        if self.initial['metrica_de_producto']:
            metrica = MetricaDeProducto.objects.get(pk=self.initial['metrica_de_producto'])
            roles = RolDeProyecto.objects.filter(proyecto=metrica.producto.fase.proyecto)
            usuarios = User.objects.filter(pk__in=[rol.usuario.id for rol in roles])
            self.fields['responsable'].queryset = usuarios

class FormularioActualizarProductoDeTrabajo(forms.ModelForm):
    class Meta:
        model = ProductoDeTrabajoDeFase
        fields = ['archivo']
        exclude = ['producto', 'fase', 'estatus', 'ultima_actualizacion']

    def __init__(self, *args, **kwargs):
        super(FormularioActualizarProductoDeTrabajo, self).__init__(*args, **kwargs)

class FormularioAprobarCriteriosProductoDeTrabajo(forms.ModelForm):
    class Meta:
        model = ProductoDeTrabajoDeFase
        fields = ['producto', 'estatus']
        exclude = ['archivo', 'fase', 'ultima_actualizacion']

    def __init__(self, *args, **kwargs):
        super(FormularioAprobarCriteriosProductoDeTrabajo, self).__init__(*args, **kwargs)
        self.fields['estatus'].queryset = EstatusDeProductos.objects.filter(valor__in=[3,4])
        instance = getattr(self, 'instance', None)
        if instance and instance.pk:
            self.fields['producto'].widget = forms.HiddenInput()
            self.fields['estatus'].widget.attrs['readonly'] = True
