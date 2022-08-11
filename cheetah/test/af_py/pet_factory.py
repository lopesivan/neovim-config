from abc import ABCMeta, abstractmethod


# Factory classes
class PetFactory:
    __metaclass__ = ABCMeta

    @abstractmethod
    def get_pet(self):
        pass

    @abstractmethod
    def get_food(self):
        pass
