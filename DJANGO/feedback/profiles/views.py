from django.shortcuts import render
from django.views import View
from .models import UserProfile
from django.http import HttpResponseRedirect
from .forms import ProfileForm
from django.views.generic.edit import CreateView
from django.views.generic import ListView


class CreateProfileView(CreateView):
    template_name = "profiles/create_profile.html"
    model = UserProfile
    fields = "__all__"
    success_url = "/profiles"


class ProfilesView(ListView):
    model = UserProfile
    template_name = "profiles/user_profiles.html"
    context_object_name = "profiles"


# without create view
# class CreateProfileView(View):
#     def get(self, request):
#         form = ProfileForm
#         return render(request, "profiles/create_profile.html", {
#             "form": form
#         })
#
#     def post(self, request):
#         submitted_form = ProfileForm(request.POST, request.FILES)
#         if submitted_form.is_valid():
#             # here image is the name of the field in model, columnName in table
#             # user_image is the specified name in the form
#             profile = UserProfile(image=request.FILES["user_image"])
#             profile.save()
#             return HttpResponseRedirect("/profiles")
#         return render(request, "profiles/create_profile.html", {
#             "form": submitted_form
#         })
