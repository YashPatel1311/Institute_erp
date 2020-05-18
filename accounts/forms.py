from django import forms 
from .models import User
from django.contrib.auth.forms import ReadOnlyPasswordHashField

class UserAdminCreationForm(forms.ModelForm):

    password1=forms.CharField(label='Password',widget=forms.PasswordInput)
    password2=forms.CharField(label='Password Conformation',widget=forms.PasswordInput)

    CHOICES=[(0,'Faculty'),(1,'Student'),(None,'Unknown')]

    # role= forms.ChoiceField(choices=CHOICES)
    role = forms.ChoiceField(choices=CHOICES,widget=forms.Select)
    # is_student = forms.ChoiceField(choices=CHOICES,widget=forms.RadioSelect)

    class Meta:
        model=User
        fields=('email',)

    def clean_password2(self):
        password1=self.cleaned_data.get('password1')
        password2=self.cleaned_data.get('password2')

        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Passwords don't match")
        return password2


    def save(self,commit=True):

        user=super(UserAdminCreationForm,self).save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        if commit:
            user.save()
        return user


class UserAdminChangeForm(forms.ModelForm):

    CHOICES=[(0,'Faculty'),(1,'Student'),(None,'Unknown')]

    password=ReadOnlyPasswordHashField()
    
    role = forms.NullBooleanField(disabled=True,widget=forms.NullBooleanSelect)

    class Meta:
        model=User

        fields=('email','password')#'is_student','staff','admin')
    

        

    def clean_password(self):
        return self.initial["password"]

