from django.db import models
from django_google_maps import fields as map_fields


class Rental(models.Model):
    address = map_fields.AddressField(max_length=200)
    geolocation = map_fields.GeoLocationField(max_length=100)

    # I also like to make the geolocation field readonly in the admin so a user (myself) doesn’t accidentally change it to a nonsensical value. There is validation on the field so you can’t enter an incorrect value, but you could enter something that is not even close to the address you intended.
    # When you’re displaying the address back to the user, just request the map using the geocoordinates that were saved in your model. Maybe sometime when I get around to it I’ll see if I can create a method that will build that into the model.
