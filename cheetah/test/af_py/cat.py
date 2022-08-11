from pet import Pet


class Cat(Pet):

    def speak(self):
        return "meow"

    def __str__(self):
        return "Cat"
