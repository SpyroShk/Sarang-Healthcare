from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import Group, Permission
from django.contrib.contenttypes.models import ContentType
from .models import User, Category


admin.site.register(Category)


@admin.register(User)
class UserAdmin(BaseUserAdmin):
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal info', {
         'fields': ('first_name', 'last_name', 'image', 'qualifications', 'category', 'availableFrom', 'availableTo')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'isDoctor',
         'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'first_name', 'last_name', 'email', 'password1', 'password2', 'is_staff', 'isDoctor', 'is_superuser', 'is_active', 'qualifications', 'category', 'image', 'availableFrom', 'availableTo', 'groups')}
         ),
    )
    list_display = ('email', 'first_name', 'last_name',
                    'is_staff', 'isDoctor', 'is_superuser')
    list_filter = ('is_staff', 'isDoctor',
                   'is_superuser', 'is_active', 'groups')
    search_fields = ('email', 'first_name', 'last_name')
    ordering = ('email',)


    def save_model(self, request, obj, form, change):
        # If the password field is included in the form, hash the password before saving
        if 'password' in form.data:
            obj.set_password(form.data['password'])
        obj.save()

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if not request.user.is_superuser:
            # Only show users that are not superusers
            qs = qs.filter(is_superuser=False)
        return qs

    def formfield_for_manytomany(self, db_field, request=None, **kwargs):
        if db_field.name == 'groups':
            # Only show groups that the current user is allowed to manage
            if request and not request.user.is_superuser:
                allowed_groups = Group.objects.filter(
                    permissions__user=request.user, permissions__content_type__app_label='auth'
                )
                kwargs['queryset'] = allowed_groups
        elif db_field.name == 'user_permissions':
            # Only show permissions that the current user is allowed to manage
            if request and not request.user.is_superuser:
                allowed_permissions = Permission.objects.filter(
                    Q(group__user=request.user) | Q(user=request.user),
                    content_type__app_label='auth'
                ).distinct()
                kwargs['queryset'] = allowed_permissions
        return super().formfield_for_manytomany(db_field, request, **kwargs)


# Unregister the default UserAdmin class
admin.site.unregister(User)
# Register the custom UserAdmin class
admin.site.register(User, UserAdmin)
