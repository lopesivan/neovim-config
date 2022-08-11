#Abstract Factory
from ConcreteFactoryClsAdtHeader import ConcreteFactoryClsAdtHeader
from ConcreteFactoryClsAdtSource import ConcreteFactoryClsAdtSource
from ConcreteFactoryClsAdtTest import ConcreteFactoryClsAdtTest

f = {
    'AdtHeader': ConcreteFactoryClsAdtHeader(),
    'AdtSource': ConcreteFactoryClsAdtSource(),
    'AdtTest': ConcreteFactoryClsAdtTest(),
}


class AbstractFactory:
    @staticmethod
    def get_factory(factory):
        return f[factory]
