from abc import ABCMeta, abstractmethod


class Pet:
    __metaclass__ = ABCMeta

    @abstractmethod
    def speak(self):
        pass

    @abstractmethod
    def __str__(self):
        pass
