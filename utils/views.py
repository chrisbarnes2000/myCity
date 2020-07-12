from django.shortcuts import render
from django.core.files.storage import FileSystemStorage
from django.views.generic import *

# from Utils.models import Photo


def logout_view(request):
    logout(request)


def index(request):
    return render(request, "index.html", {})


def creators(request):
    return render(request, "creators.html", {})


def image_upload(request):
    fs = FileSystemStorage()
    all_photos = fs.listdir(fs.base_location)

    if request.method == "POST" and request.FILES["image_file"]:
        image_file = request.FILES["image_file"]
        filename = fs.save(image_file.name, image_file)
        image_url = fs.url(filename)
        print(image_url)
        return render(request, "upload.html", {
            "image_url": image_url, "all": all_photos
        })
    return render(request, "upload.html", {"all": all_photos})


def resources(request):
    return render(request, "resources.html", {})


def benefits(request):
    return render(request, "benefits.html", {})

# def pandemic_info(request):
#     return render(request, "pandemic_info.html", {})


def shelter_info(request):
    return render(request, "shelter_info.html", {})


def food_locations(request):
    return render(request, "food_locations.html", {})


def legal_help(request):
    return render(request, "legal_help.html", {})


def success(request):
    return HttpResponse('successfully uploaded')


def health_resources(request):
    return render(request, "helth_resources.html", {})

# class Create_Photo_View(CreateView):
#     model = Photo
#     fields = ['first_name', 'last_name',
#               'email', 'content', 'image', 'page']
#     # success_url = reverse_lazy('index')

#     def form_valid(self, form):
#         # mail_admins(
#         #     "New Photo For",
#         #     [self.page, self.image],
#         #     fail_silently=False,
#         #     connection=None,
#         #     html_message=None
#         # )
#         # form.instance.author = self.request.user
#         return super().form_valid(form)

# Msg.attach(‘file_name.type’, content, ‘MIME / type’)


# def image_upload(request):
#     if request.method == 'POST':
#         image_file = request.FILES['image_file']
#         image_type = request.POST['image_type']
#         if settings.USE_S3:
#             if image_type == 'private':
#                 upload = UploadPrivate(file=image_file)
#             else:
#                 upload = Upload(file=image_file)
#             upload.save()
#             image_url = upload.file.url
#         else:
#             fs = FileSystemStorage()
#             filename = fs.save(image_file.name, image_file)
#             image_url = fs.url(filename)
#         return render(request, 'upload.html', {
#             'image_url': image_url
#         })
#     return render(request, 'upload.html')
