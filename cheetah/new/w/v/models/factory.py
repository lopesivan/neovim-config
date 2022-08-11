from abc import ABCMeta, abstractmethod

from chef.conf.client import client
from chef.conf.knife import knife
from chef.conf.solo import solo
from chef.conf.dockerfile import dockerfile

template = {
    'chef.conf.client': client(),
    'chef.conf.knife': knife(),
    'chef.conf.solo': solo(),
    'chef.conf.dockerfile': dockerfile(),
}


class Factory(object):
    __metaclass__ = ABCMeta

    def __init__(self, template_name):
        self.tmpl = template[template_name]

    @abstractmethod
    def put(self):
        pass

    @abstractmethod
    def save(self):
        pass