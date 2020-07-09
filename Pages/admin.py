# from imagekit.admin import AdminThumbnail
from django.contrib import admin
from Pages.models import Page
# from Utils.models import Photo


# class photoInline(admin.TabularInline):
#     model = Photo
#     extra = 0


class PagesAdmin(admin.ModelAdmin):
    """ Show helpful fields on the changelist page. """
    search_fields = ['title']
    list_filter = ['title', 'created']

    list_display = ('title', 'slug',
                    'created', 'modified')

    # admin_thumbnail = AdminThumbnail(image_field='main_img')
    # inlines = [photoInline]


admin.site.register(Page, PagesAdmin)


# class PhotoAdmin(admin.ModelAdmin):
#     # fieldsets = [
#     #     (None,               {'fields': ['page']}),
#     #     # ('Date information', {'fields': ['created'], 'classes': ['collapse']}),
#     # ]

#     list_display = ('content', 'image', 'page', 'approved', 'was_published_recently', 'votes',
#                     'first_name', 'last_name', 'email', 'created')
#     list_filter = ['page', 'created', 'email', 'votes']
#     search_fields = ['page', 'content']


# admin.site.register(Photo, PhotoAdmin)
