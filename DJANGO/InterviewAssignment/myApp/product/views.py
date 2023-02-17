import json
import random
from itertools import chain

from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import viewsets
from rest_framework.decorators import api_view
from rest_framework.generics import get_object_or_404
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response

from .serializers import ProductSerializer
from .models import Product


# For scalability
class ProductPagination(PageNumberPagination):
    page_size = 100
    page_size_query_param = 'page_size'
    max_page_size = 1000


def unique_products(queryset):
    unique_products = []
    seen_brands_categories = set()
    for product in queryset:
        if (product.brand, product.category) not in seen_brands_categories:
            seen_brands_categories.add((product.brand, product.category))
            unique_products.append(product)
            queryset.remove(product)
    return unique_products, queryset


class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    pagination_class = ProductPagination

    def list(self, request, *args, **kwargs):
        # unique_products = []
        # seen_brands_categories = set()
        # for product in self.get_queryset():
        #     if (product.brand, product.category) not in seen_brands_categories:
        #         seen_brands_categories.add((product.brand, product.category))
        #         unique_products.append(product)
        global new
        print(type(self.get_queryset()))
        products = list(self.get_queryset())
        ans=[]
        while products:
            few, prods = unique_products(products)
            # print(few[0].name)
            products = prods
            # new.extend(few)
            ans.extend(few)

        # Shuffle the rest of the queryset
        # rest_of_queryset = self.get_queryset().exclude(pk__in=[p.pk for p in unique_products]).order_by('?')

        # Concatenate the unique products with the shuffled rest of the queryset
        # queryset = list(chain(unique_products, rest_of_queryset))
        print(ans)
        # serializer = ProductSerializer(queryset, many=True)
        # return Response(serializer.data)


@api_view(['GET'])
def similar_products(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    similar_brand_category = Product.objects.filter(brand=product.brand, category=product.category)
    similar_brand = Product.objects.filter(brand=product.brand).exclude(category=product.category)
    similar_category = Product.objects.filter(category=product.category).exclude(brand=product.brand)
    data = {
        'same_brand_same_category': ProductSerializer(similar_brand_category, many=True).data,
        'same_brand_different_category': ProductSerializer(similar_brand, many=True).data,
        'different_brand_same_category': ProductSerializer(similar_category, many=True).data,
    }
    return Response(data)
