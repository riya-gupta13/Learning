from django.shortcuts import render, get_object_or_404
from .models import Book
from django.db.models import Avg


# Create your views here.
def index(request):
    # or order_by('-rating')--descending order
    books = Book.objects.all().order_by("title")
    num_of_books = books.count()
    avg_rating = books.aggregate(Avg('rating'))
    return render(request, "book_outlet/index.html", {
        "books": books,
        "total_number_of_books":num_of_books,
        "average_rating":avg_rating
    })


def book_detail(request, slug):
    # book = get_object_or_404(Book, pk=id)
    # to avoid 404 error we can use ths
    book = Book.objects.get(slug=slug)
    return render(request, "book_outlet/book_detail.html", {
        "title": book.title,
        "author": book.author,
        "rating": book.rating,
        "is_bestseller": book.isbestselling
    })
