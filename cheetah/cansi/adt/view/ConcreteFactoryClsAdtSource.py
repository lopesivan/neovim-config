from ClsAdtSource import ClsAdtSource


class ConcreteFactoryClsAdtSource:
    def get_ball(self, dataModel):
        return ClsAdtSource(dataModel)
