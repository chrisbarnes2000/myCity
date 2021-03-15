from django.shortcuts import render


def logout_view(request):
    logout(request)


def index(request):
    return render(request, "index.html", {})


def creators(request):
    return render(request, "creators.html", {})


# def resources(request):
#     return render(request, "resources.html", {})


# def benefits(request):
#     return render(request, "benefits.html", {})

# def pandemic_info(request):
#     return render(request, "pandemic_info.html", {})


# def shelter_info(request):
#     return render(request, "shelter_info.html", {})


# def food_locations(request):
#     return render(request, "food_locations.html", {})


# def legal_help(request):
#     return render(request, "legal_help.html", {})


# def success(request):
#     return HttpResponse('successfully uploaded')


# def health_resources(request):
#     return render(request, "helth_resources.html", {})
