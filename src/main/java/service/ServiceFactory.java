package service;

import service.custom.Impl.CategoryServiceImpl;
import service.custom.Impl.SubCategoryServiceImpl;

public class ServiceFactory {
    private static ServiceFactory serviceFactory;

    private ServiceFactory() {

    }

    public static ServiceFactory getInstance() {
        if (serviceFactory == null) {
            serviceFactory = new ServiceFactory();
        }
        return serviceFactory;
    }

    public SuperService getServiceType(ServiceType types) {
        switch (types) {
            case CATEGORY:
                return new CategoryServiceImpl();
            case SUBCATEGORY:
                return new SubCategoryServiceImpl();
            default:
                return null;
        }
    }

    public enum ServiceType {
        CATEGORY, SUBCATEGORY
    }
}
