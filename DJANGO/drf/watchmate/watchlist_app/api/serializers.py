from rest_framework import serializers
from ..models import WatchList, StreamPlatform, Review


# HyperlinkedModelSerializer is similar to ModelSerializer, except it uses hyperlinks to represnt relations,
# rather primary keys
class ReviewSerializer(serializers.ModelSerializer):
    review_user = serializers.StringRelatedField(read_only=True)
    class Meta:
        model = Review
        # fields = '__all__'
        exclude=('watchlist',)


# ModelSerializer
class WatchListSerializer(serializers.ModelSerializer):
    # SerializerMethodField is used to perform some action on our fields
    # so tht ths field can be included in our api view
    # len_name = serializers.SerializerMethodField()
    reviews = ReviewSerializer(many=True, read_only=True)

    class Meta:
        model = WatchList
        fields = '__all__'


class StreamPlatformSerializer(serializers.ModelSerializer):
    # nestedSerializer
    # remember here watchlist is the name we mentioned in the model
    watchlist = WatchListSerializer(many=True, read_only=True)

    # so if we dont want to show whole dat of wtchlist in stream we can chnge it like this for strng it will return
    # the str fxn of wtchlists data
    # watchlist=serializers.StringRelatedField(many=True)

    # view-name is the name of the url we mentioned in ulr.py
    # watchlist = serializers.HyperlinkedRelatedField(many=True, read_only=True, view_name='movie-detail')

    class Meta:
        model = StreamPlatform
        fields = '__all__'

    # fields = ['id', 'name', 'description']
    # exclude=['active']

    # # syntax get_<mthdname>
    # def get_len_name(self, object):
    #     length = len(object.name)
    #     return length
    #
    # # this is field level validation
    # def validate_name(self, value):
    #     if len(value) < 2:
    #         raise serializers.ValidationError("Name is too short")
    #     else:
    #         return value
    #
    # # object level validation
    # def validate(self, data):
    #     if data['name'] == data['description']:
    #         raise serializers.ValidationError("Name and Description should not be same")
    #     return data

# Serializers
# # this is thrd type of validation-->validators, create fxn and pass in serializer itself
# def name_length(value):
#     if len(value) < 2:
#         raise serializers.ValidationError("Name is too short")
#
#
# class MovieSerializer(serializers.Serializer):
#     # read_only means we are not going to change it
#     id = serializers.IntegerField(read_only=True)
#     name = serializers.CharField(validators=[name_length])
#     description = serializers.CharField()
#     active = serializers.BooleanField()
#
#     def create(self, validated_data):
#         return Movie.objects.create(**validated_data)
#
#     def update(self, instance, validated_data):
#         # we are trying to update the old data(instance) with new data(validated_data)
#         instance.name = validated_data.get('name', instance.name)
#         instance.description = validated_data.get('description', instance.description)
#         instance.active = validated_data.get('active', instance.active)
#         instance.save()
#         return instance
#
#     # this is field level validation
#     # def validate_name(self, value):
#     #     if len(value) < 2:
#     #         raise serializers.ValidationError("Name is too short")
#     #     else:
#     #         return value
#
#     # object level validation
#     def validate(self, data):
#         if data['name'] == data['description']:
#             raise serializers.ValidationError("Name and Description should not be same")
#         return data
