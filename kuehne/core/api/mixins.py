from rest_framework.generics import ListAPIView
from rest_framework.response import Response


class ListAPIViewMixin(ListAPIView):
    """ 
    Mixin to change the behavior of list method
    and return the correct information
    to each case:
    - Multiple objects
    - One Object
    - None
    """
    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        if len(serializer.data) < 1:
            reply = {
                "message": "Object not found"
            }
            return Response(reply, 404)
        return Response(serializer.data)
