import requests
import json
import os
from django.conf import settings
from django.contrib.auth import logout
from django.core.files.storage import FileSystemStorage
from django.core.mail import send_mail, mail_admins
from django.core.paginator import Paginator
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import get_object_or_404, redirect, render
from django.urls import reverse, reverse_lazy
from django.utils import timezone
from django.views.generic import *

from Pages.models import Page


def Pages_Landing(request):
    return render(request, 'pages_landing.html')


class Create_Page_View(CreateView):
    model = Page
    fields = ['title', 'content', 'main_img', 'sources']

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)


class Display_Pages_View(ListView):
    template_name = 'Pages/display_pages.html'
    context_object_name = 'Pages'
    paginate_by = 9

    def get_queryset(self):
        return Page.objects.all()


class Detail_Page_View(DetailView):
    model = Page
    template_name = 'Pages/page.html'

    def vote(self, request):
        page = get_object_or_404(Page, slug=self.slug)
        try:
            selected_photo = page.photo_set.get(pk=request.POST['photo'])
        except (KeyError, Photo.DoesNotExist):
            # Redisplay the question voting form.
            return render(request, 'Pages/page.html', {
                'page': Page,
                'error_message': "You didn't select a photo.",
            })
        else:
            selected_photo.votes += 1
            selected_photo.save()
            # Always return an HttpResponseRedirect after successfully dealing
            # with POST data. This prevents data from being posted twice if a
            # user hits the Back button.
            return HttpResponseRedirect(reverse('page-details', slug=page.slug))


class Edit_Page_View(UpdateView):
    model = Page
    fields = ['title', 'content', 'sources']

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)


class Delete_Page_View(DeleteView):
    model = Page
    success_url = reverse_lazy('index')
