from cat import Cat
from pet_factory import PetFactory


class CatFactory(PetFactory):

    def get_pet(self):
        return Cat()

    def get_food(self):
        return "cat food"
