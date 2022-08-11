from abstract_factory import AbstractFactory

if __name__ == "__main__":

    factory = AbstractFactory().get_factory("Dog")
    dog = factory.get_pet()
    print "O %s late assim %s" % (dog, dog.speak())
    print factory.get_food()

    factory = AbstractFactory().get_factory("Cat")
    print factory.get_pet()
    print factory.get_food()