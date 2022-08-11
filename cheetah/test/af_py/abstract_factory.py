from cat_factory import CatFactory
from dog_factory import DogFactory


f = {
    'Dog': DogFactory(),
    'Cat': CatFactory(),
}

class AbstractFactory:
    @staticmethod
    def get_factory(factory):
        return f[factory]