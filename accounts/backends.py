from django.contrib.auth import get_user_model

User=get_user_model()

class EmailBackends(Object):

    def authenticate(self,username=None,password=None):
        try:
            user_obj=User.objects.get(email=username)
        except User.DoesNotExists as identifier:
            return None

        if user_obj.is_active() and user_obj.check_password(password):
            return user_obj

        return None

    def get_user(self,user_id):
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExists:
            return None