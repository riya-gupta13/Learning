# from django.http import JsonResponse
# from django.shortcuts import render
# from watchlist_app.models import Movie
#
#
# def movie_list(request):
#     movies = Movie.objects.all()
#     # values is use to give us queryset in form of dictionary
#     # we can convert it into iterable
#     # we are coverting into dict to get json
#     data = {
#         'movies': list(movies.values())
#     }
#     return JsonResponse(data)
#
#
# def movie_details(request, pk):
#     movie = Movie.objects.get(pk=pk)
#     data = {
#         'name': movie.name,
#         'description': movie.description,
#         'active': movie.active
#     }
#     return JsonResponse(data)
