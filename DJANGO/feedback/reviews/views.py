from django.shortcuts import render
from django.shortcuts import HttpResponseRedirect
from .forms import ReviewForm
from django.views import View
from django.views.generic.base import TemplateView
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView
from .models import Review


class ReviewView(CreateView):
    model = Review
    form_class = ReviewForm
    template_name = "reviews/review.html"
    success_url = "/thank-you"


# class ReviewView(FormView):
#     form_class = ReviewForm
#     template_name = "reviews/review.html"
#     success_url = "/thank-you"
#
#     def form_valid(self, form):
#         form.save()
#         return super().form_valid(form)


# # without formView
# class ReviewView(View):
#     def get(self, request):
#         form = ReviewForm()
#         return render(request, "reviews/review.html", {
#             "form": form
#         })
#
#     def post(self, request):
#         form = ReviewForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return HttpResponseRedirect("/thank-you")
#         return render(request, "reviews/review.html", {
#             "form": form
#         })


# Create your views here.
# def review(request):
#     if request.method == 'POST':
#         form = ReviewForm(request.POST)
#         if form.is_valid():
#             # here we are getting the data that we entered into form to the model then saving it to database
#             # review = Review(user_name=form.cleaned_data['user_name'], review_text=form.cleaned_data['review_text'],
#             #                 rating=form.cleaned_data['rating'])
#             form.save()
#             # print(form.cleaned_data)
#             # here /thank-you is the url that we registered in urls.py, which indirectly calls the thank_you fxn
#             return HttpResponseRedirect("/thank-you")
#     else:
#         form = ReviewForm()
#     return render(request, "reviews/review.html", {
#         "form": form
#     })

class ThankYouView(TemplateView):
    template_name = "reviews/thank_you.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["message"] = "This Works"
        return context


# def thank_you(request):
#     return render(request, "reviews/thank_you.html", {
#         "has_error": False
#     })

class ReviewListView(ListView):
    template_name = "reviews/review_list.html"
    model = Review
    # this is the name of the object that we use in template to render in for loop
    context_object_name = "reviews"

    # for filtering we can do this
    def get_queryset(self):
        base_query = super().get_queryset()
        # rating greater than 4
        data = base_query.filter(rating__gt=4)
        return data


class SingleReviewView(DetailView):
    template_name = "reviews/single_review.html"
    model = Review

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        loaded_review = self.object
        request = self.request
        favorite_id = request.session.get("favorite_review")
        context["is_favorite"] = favorite_id == str(loaded_review.id)
        return context


class AddFavouriteView(View):
    def post(self, request):
        review_id = request.POST["review_id"]
        request.session["favorite_review"] = review_id
        return HttpResponseRedirect("/reviews/" + review_id)
