# -*- coding: utf-8 -*-
from django import forms
from django.db.models import Q
from models import *
from django.utils.translation import ugettext, ugettext_lazy as _
from django.contrib.auth.models import User
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm, UserChangeForm, PasswordChangeForm
from django.forms.extras.widgets import SelectDateWidget
import datetime, time

class RegisterForm(UserCreationForm):
    email = forms.EmailField(label = "Correo electrónico")
    fullname = forms.CharField(label = "Nombre completo")

    class Meta:
        model = User
        fields = ("username", "fullname", "email", )

    def clean_email(self):
        email = self.cleaned_data.get('email')
        username = self.cleaned_data.get('username')
        if email and User.objects.filter(email=email).exclude(username=username).exists():
            raise forms.ValidationError(u'Ya se encuentra registrado el correo, acceda a recuperar su contraseña.')
        return email

class PasswordChangeForm(forms.Form):
    password = forms.CharField(label = "Contraseña",widget=forms.PasswordInput())
    cn_password = forms.CharField(label = "Confirme la contraseña",widget=forms.PasswordInput())
        
class UserUpdateForm(forms.ModelForm):

    class Meta:
        model = User
        fields = ('username', 'email', 'first_name', 'last_name')

    def clean_email(self):
        username = self.cleaned_data.get('username')
        email = self.cleaned_data.get('email')
        try:
            user = User.objects.get(Q(username=username) | Q(email=email))
        except Exception as e:
            raise forms.ValidationError('Por seguridad no puede cambiar su nombre de usuario y correo simultaneamente.')
        if email and User.objects.filter(email=email).exclude(pk=user.id).count():
            raise forms.ValidationError('Este correo se encuentra registrado.')
        if username and User.objects.filter(username=username).exclude(pk=user.id).count():
            raise forms.ValidationError('Este nombre de usuario se encuentra registrado.')
        return email

class FormularioRecover(forms.Form):
    email = forms.EmailField(label = "Correo eléctronico")
        
class FormularioLogin(forms.Form):
    username = forms.CharField(label='Correo electronico:', max_length=50)
    password = forms.CharField(label='Contraseña:',widget=forms.PasswordInput())

class FormularioAprobarProyecto(forms.ModelForm):

    class Meta:
        model = Proyecto
        exclude = ['nombre_del_equipo', 'metodologia']
        fields = ['nombre', 'cliente', 'estatus', 'usuario_registro']

    def __init__(self, *args, **kwargs):
        super(FormularioAprobarProyecto, self).__init__(*args, **kwargs)
        self.fields['usuario_registro'].widget = forms.HiddenInput()
        instance = getattr(self, 'instance', None)
        if instance and instance.pk:
            self.fields['nombre'].widget.attrs['readonly'] = True
            self.fields['cliente'].widget.attrs['readonly'] = True

    def clean(self):
        try:
            proyecto = self.instance
            fases = FaseDeProyecto.objects.filter(proyecto= proyecto)
        except Exception as e:
            raise e
        pass

class FormularioProyecto(forms.ModelForm):

    class Meta:
        model = Proyecto
        fields = ['nombre', 'cliente', 'nombre_del_equipo', 'usuario_registro']
        exclude = ['estatus']

    def __init__(self, *args, **kwargs):
        super(FormularioProyecto, self).__init__(*args, **kwargs)
        self.fields['usuario_registro'].widget = forms.HiddenInput()

class FormularioRol(forms.Form):
    rol = forms.ModelChoiceField(queryset=Rol.objects.all())
    usuario = forms.EmailField(label='Correo eléctronico')
    proyecto =  forms.HiddenInput()

    def clean(self):
        try:
            data = self.cleaned_data
            user = User.objects.get(email=data['usuario'])
            if not user:
                raise forms.ValidationError('El correo '+data['usuario']+' no se encuentra registrado.')
        except Exception as e:
            raise forms.ValidationError(str(e))
        pass

class FormularioEvento(forms.ModelForm): 

    class Meta:
        model = EventoDeProyecto
        widgets = {
            'asunto': forms.Textarea(attrs={'cols': 20, 'rows': 6}),
        }
        fields = ["proyecto", "evento", "asunto", "fecha", "hora","asistentes"]

    def __init__(self, *args, **kwargs):
        super(FormularioEvento, self).__init__(*args, **kwargs)
        self.fields['proyecto'].widget = forms.HiddenInput()
        self.fields['fecha'].widget.attrs['readonly'] = True
        if self.initial['proyecto']:
            roles = RolDeProyecto.objects.filter(proyecto=self.initial['proyecto'])
            usuarios = User.objects.filter(pk__in=[rol.usuario.id for rol in roles])
            self.fields['asistentes'].queryset = usuarios

    def clean(self):
        data = self.cleaned_data
        if data['fecha'] < datetime.date(datetime.datetime.now().year,datetime.datetime.now().month,datetime.datetime.now().day):
            raise forms.ValidationError('La fecha no puede ser anterior a la fecha actual '+datetime.datetime.now().strftime('%Y/%m/%d'))
        if data['fecha'] == datetime.date(datetime.datetime.now().year,datetime.datetime.now().month,datetime.datetime.now().day):
            if data['hora'].hour <= datetime.datetime.now().hour:
                if data['hora'].minute < datetime.datetime.now().minute:
                    raise forms.ValidationError('La hora no puede ser anterior a la hora actual ')

class FormularioFase(forms.ModelForm): 

    class Meta:
        model = FaseDeProyecto
        fields = ['proyecto', 'fase', 'fecha_de_inicio', 'fecha_de_cierre']

    def __init__(self, *args, **kwargs):
        super(FormularioFase, self).__init__(*args, **kwargs)
        self.fields['proyecto'].widget = forms.HiddenInput()
        self.fields['fecha_de_inicio'].widget = SelectDateWidget()
        self.fields['fecha_de_cierre'].widget = SelectDateWidget()

    def get_id_fase(self):
        return self.cleaned_data.get('fase_id').id

class FormularioEditarProductoDeFase(forms.ModelForm):
    class Meta:
        model = ProductoDeTrabajoDeFase
        fields = ('fase', 'producto', 'plantilla', 'archivo','ultima_actualizacion')

    def __init__(self, *args, **kwargs):
        super(FormularioEditarProductoDeFase, self).__init__(*args, **kwargs)
        self.fields['fase'].widget = forms.HiddenInput()
        self.fields['ultima_actualizacion'].widget = forms.HiddenInput()
        if 'instance' in kwargs:
            producto = self.instance
            self.fields['producto'].queryset = producto.fase.fase.productos_de_trabajo.all()


class FormularioProductoDeFase(forms.ModelForm):
    class Meta:
        model = ProductoDeTrabajoDeFase
        fields = ('fase', 'producto', 'plantilla', 'archivo', 'estatus')

    def __init__(self,fase_de_proyecto, *args, **kwargs):
        super(FormularioProductoDeFase, self).__init__(*args, **kwargs)
        self.initial={'fase': fase_de_proyecto}
        self.fields['fase'].widget = forms.HiddenInput()
        self.fields['estatus'].widget = forms.HiddenInput()
        self.fields['producto'].queryset = fase_de_proyecto.fase.productos_de_trabajo.all()

class FormularioCriteriosDeProducto(forms.ModelForm):
    class Meta:
        model = CriterioDeProducto
        exclude = ['status']
        fields = ['producto', 'criterio']

    def __init__(self, *args, **kwargs):
        super(FormularioCriteriosDeProducto, self).__init__(*args, **kwargs)
        self.fields['producto'].widget = forms.HiddenInput()

class FormularioMetricasDeProducto(forms.ModelForm):
    class Meta:
        model = MetricaDeProducto
        fields = ['producto', 'metrica', 'indice', 'limite_superior', 'limite_inferior']

    def __init__(self, producto_de_fase, *args, **kwargs):
        super(FormularioMetricasDeProducto, self).__init__(*args, **kwargs)
        self.initial={'producto': producto_de_fase}
        self.fields['producto'].widget = forms.HiddenInput()
        self.fields['metrica'].queryset = producto_de_fase.producto.metricas.all()

class FormularioMetricasDeProductoEdit(forms.ModelForm):
    class Meta:
        model = MetricaDeProducto
        fields = ['producto', 'metrica', 'indice', 'limite_superior', 'limite_inferior']
