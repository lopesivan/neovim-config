from ClsAdtHeader import ClsAdtHeader


class ConcreteFactoryClsAdtHeader:
    def get_ball(self, dataModel):
        return ClsAdtHeader(dataModel)
