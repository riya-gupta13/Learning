from django.urls import path
from . import views

urlpatterns = [
    path('products/', views.ProductViewSet.as_view({'get': 'list'})),
    path('similar-products/<int:product_id>/', views.similar_products),
    # path('similar-products/<int:product_id>/', views.SimilarProductViewSet.as_view({'get': 'list'})),

]
