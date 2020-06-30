from django.db import models
from django_google_maps import fields as map_fields


class Rental(models.Model):
    address = map_fields.AddressField(max_length=200)
    geolocation = map_fields.GeoLocationField(max_length=100)

    # I also like to make the geolocation field readonly in the admin so a user (myself) doesn’t accidentally change it to a nonsensical value. There is validation on the field so you can’t enter an incorrect value, but you could enter something that is not even close to the address you intended.
    # When you’re displaying the address back to the user, just request the map using the geocoordinates that were saved in your model. Maybe sometime when I get around to it I’ll see if I can create a method that will build that into the model.


# class Photo(models.Model):
#     """ Represents a single Photo. """
#     objects = models.Manager()
#     created = models.DateTimeField(
#         auto_now_add=True, help_text="The date and time this page was created. Automatically generated when the model saves.")
#     approved = models.BooleanField(default=False)
#     page = models.ForeignKey(
#         Page, default=None, on_delete=models.PROTECT)

#     image = models.ImageField(storage=PublicMediaStorage(), null=False)
#     # private = models.ImageField(storage=PrivateMediaStorage(), null=False)
#     content = models.TextField(default="Write the content of your page here.")
#     votes = models.IntegerField(default=0)

#     first_name = models.CharField(max_length=35)
#     last_name = models.CharField(max_length=35)
#     email = models.EmailField(max_length=200)

#     def was_published_recently(self):
#         now = timezone.now()
#         return now - datetime.timedelta(days=1) <= self.created <= now
#     was_published_recently.admin_order_field = 'created'
#     was_published_recently.boolean = True
#     was_published_recently.short_description = 'Published recently?'

#     def get_absolute_url(self):
#         """ Redirects to the page this photo was uploaded for. """
#         path_components = {'slug': self.page.slug}
#         return reverse('page-details', kwargs=path_components)

#     def save(self, *args, **kwargs):
#         """ Creates a URL safe slug automatically when a new a page is created. """

#         # Call save on the superclass.
#         return super(Photo, self).save(*args, **kwargs)
