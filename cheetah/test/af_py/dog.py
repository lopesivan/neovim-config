from pet import Pet


class Dog(Pet):

    def speak(self):
        return "woof"

    def __str__(self):
        return "Dog"
