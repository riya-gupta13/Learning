from rest_framework.throttling import UserRateThrottle

# custom throttling

class ReviewCreateThrottle(UserRateThrottle):
    scope = 'review-create'


class ReviewListThrottle(UserRateThrottle):
    scope = 'review-list'
