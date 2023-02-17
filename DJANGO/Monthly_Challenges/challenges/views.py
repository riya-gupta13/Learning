from django.shortcuts import render
from django.http import HttpResponse, HttpResponseNotFound, HttpResponseRedirect
from django.urls import reverse
from django.template.loader import render_to_string

monthly_challenges = {
    "january": "Eat no meat",
    "february": "Walk for atleast for 20 minutes every day",
    "march": "Learn Django for atleast for 20 minutes every day",
    "april": "Eat no meat",
    "may": "Walk for atleast for 20 minutes every day",
    "june": "Learn Django for atleast for 20 minutes every day",
    "july": "Eat no meat",
    "august": "Walk for atleast for 20 minutes every day",
    "october": "Learn Django for atleast for 20 minutes every day",
    "september": "Eat no meat",
    "november": "Walk for atleast for 20 minutes every day",
    "december": None
}


def index(request):
    # list_items = ""
    months = list(monthly_challenges.keys())
    # for month in months:
    #     capitalized_month = month.capitalize()
    #     month_path = reverse("month-challenge", args=[month])
    #     list_items += "<li><a href=\"{}\">{}</a></li>".format(month_path, capitalized_month)
    # response = "<ul>{}</ul>".format(list_items)
    # return HttpResponse(response)
    return render(request, "challenges/index.html", {
        "months": months
    })


# Create your views here.
def monthly_challenge_by_number(request, month):
    months = list(monthly_challenges.keys())
    redirect_month = months[month - 1]
    if month > len(months):
        return HttpResponseNotFound("Invalid Month")
    redirect_path = reverse("month-challenge", args=[redirect_month])  # challenges/january
    return HttpResponseRedirect(redirect_path)


def monthly_challenge(request, month):

    try:
        challenge_text = monthly_challenges[month]
        # response_data = "<h1>{}</h1".format(challenge_text)
        return render(request, "challenges/challenge.html", {
            "text": challenge_text,
            "month_name": month
        })
        # response_data = render_to_string("challenges/challenge.html")
        # return HttpResponse(response_data)
    except:
        response_data = render_to_string("404.html")
        return HttpResponseNotFound(response_data)
