from django.db import models 

# Create your models here.
class medicine_details(models.Model):
    product_name = models.CharField(max_length=100,null=True,blank=True)
    product_number = models.BigIntegerField(null=True,blank=True,unique=True)
    quantity = models.BigIntegerField(null=True,blank=True)
    price = models.BigIntegerField(null=True,blank=True)
    cure_disases = models.CharField(max_length=100,null=True,blank=True)
    product_image = models.ImageField(upload_to='medicine_images/', null=True, blank=True)
    about_product = models.TextField(null=True,blank=True)
    product_type = models.CharField(max_length=100,null=True,blank=True)


    def __int__(self):
        return self.product_number
    
#####################################################################Add_pati_address########################################

# class pati_address(models.Model):
#     full_name = models.CharField(max_length=100,null=True,blank=True)
#     Pry_phone_number = models.BigIntegerField()
#     sec_phone_number = models.BigIntegerField(null=True,blank=True)
#     flat_house_name = models.CharField(max_length=100,null=True,blank=True)
#     area_building_name = models.CharField(max_length=100,null=True,blank=True)
#     landmark = models.CharField(max_length=100,null=True,blank=True)
#     pincode = models.BigIntegerField(null=True,blank=True)
#     Town_City = models.CharField(max_length=100,null=True,blank=True)
#     state_name = models.CharField(max_length=100,null=True,blank=True)

    # def __int__(self):
    #     return self.Pry_phone_number

class pati_address(models.Model):
    full_name = models.CharField(max_length=100, null=True, blank=True)
    pry_phone_number = models.BigIntegerField()
    sec_phone_number = models.BigIntegerField(null=True, blank=True)
    flat_house_name = models.CharField(max_length=100, null=True, blank=True)
    area_building_name = models.CharField(max_length=100, null=True, blank=True)
    landmark = models.CharField(max_length=100, null=True, blank=True)
    pincode = models.BigIntegerField(null=True, blank=True)
    town_city = models.CharField(max_length=100, null=True, blank=True)
    state_name = models.CharField(max_length=100, null=True, blank=True)
    sequence_number = models.IntegerField(default=1, editable=False)

    def save(self, *args, **kwargs):
        if not self.pk:  # Only set sequence_number for new instances
            # Ensure we get the max sequence_number or 0 if none exists
            last_sequence = pati_address.objects.filter(
                pry_phone_number=self.pry_phone_number
            ).aggregate(max_seq=models.Max('sequence_number'))['max_seq'] or 0
            # Set sequence_number to the next value
            self.sequence_number = last_sequence + 1
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.pry_phone_number} - Address {self.sequence_number}"
    

##############################################################################order placed detials ########################################################################    

class order_placed_details(models.Model):
    product_details = models.ForeignKey(medicine_details,on_delete=models.CASCADE)
    user_details = models.ForeignKey(pati_address,on_delete=models.CASCADE)
    product_name = models.CharField(max_length=100,null=True,blank=True)
    product_number = models.BigIntegerField(null=True,blank=True)
    quantity = models.BigIntegerField(null=True,blank=True)
    price = models.BigIntegerField(null=True,blank=True)
    purchase_quantity = models.IntegerField(null=True,blank=True)
    purchase_total_price = models.IntegerField(null=True,blank=True)
    purchase_pay_type = models.CharField(max_length=100,null=True,blank=True)
    order_date=models.CharField(max_length=100,null=True,blank=True)
    cure_disases = models.CharField(max_length=100,null=True,blank=True)
    product_image = models.FileField(null=True,blank=True)
    about_product = models.TextField(null=True,blank=True)
    product_type = models.CharField(max_length=100,null=True,blank=True)
    full_name = models.CharField(max_length=100, null=True, blank=True)
    pry_phone_number = models.BigIntegerField(null=True,blank=True)
    sec_phone_number = models.BigIntegerField(null=True, blank=True)
    flat_house_name = models.CharField(max_length=100, null=True, blank=True)
    area_building_name = models.CharField(max_length=100, null=True, blank=True)
    landmark = models.CharField(max_length=100, null=True, blank=True)
    pincode = models.BigIntegerField(null=True, blank=True)
    town_city = models.CharField(max_length=100, null=True, blank=True)
    state_name = models.CharField(max_length=100, null=True, blank=True)
    sequence_number = models.IntegerField(null=True,blank=True)

    def __int__(self):
        return self.pry_phone_number

################################################################# add to card #################################################################

class add_to_cart(models.Model):
    products = models.ForeignKey(medicine_details,on_delete=models.CASCADE)
    pry_phone_number = models.BigIntegerField(null=True,blank=True)
    product_name = models.CharField(max_length=100,null=True,blank=True)
    product_number = models.BigIntegerField(null=True,blank=True)
    quantity = models.BigIntegerField(null=True,blank=True)
    price = models.BigIntegerField(null=True,blank=True)
    cure_disases = models.CharField(max_length=100,null=True,blank=True)
    product_image = models.FileField(null=True,blank=True)
    about_product = models.TextField(null=True,blank=True)
    product_type = models.CharField(max_length=100,null=True,blank=True)

    def __int__(self):
        return self.pry_phone_number





