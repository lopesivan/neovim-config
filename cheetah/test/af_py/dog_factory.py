from dog import Dog
from pet_factory import PetFactory


class DogFactory(PetFactory):

    def get_pet(self):
        return Dog()

    def get_food(self):
        return "dog food"
