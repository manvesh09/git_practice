using { ProcurementService } from '../../srv/procurement-service';
 
annotate ProcurementService.Products with @UI: {
 
    SelectionFields: [
        productName,
        price,
        stock,
        category_ID,
        supplier_ID,
        isAvailable
    ],
 
    LineItem: [
        { Value: productName, Label: 'Product', ![@UI.Importance]: #High },
        { Value: price, Label: 'Price' },
        { Value: stock, Label: 'Stock', Criticality: stockCriticality },
        { Value: rating, Label: 'Rating' },
        { Value: supplier.supplierName, Label: 'Supplier' },
        { Value: category.categoryName, Label: 'Category', ![@UI.Importance]: #Low },
        { Value: isAvailable, Label: 'Available' }
    ],
 
    HeaderInfo: {
        TypeName: 'Product',
        TypeNamePlural: 'Products',
        Title: { Value: productName },
        Description: { Value: description }
    },
 
    HeaderFacets: [
        { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Price' },
        { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Stock' },
        { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Rating' }
    ],
 
    DataPoint#Price: {
        Value: price,
        Title: 'Price'
    },
 
    DataPoint#Stock: {
        Value: stock,
        Title: 'In Stock',
        Criticality: stockCriticality
    },
 
    DataPoint#Rating: {
        Value: rating,
        Title: 'Rating',
        TargetValue: 5,
        Visualization: #Rating
    },
 
    Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#GeneralInfo',
            Label: 'General Information'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#StockPricing',
            Label: 'Stock & Pricing'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Admin',
            Label: 'Administration'
        }
    ],
 
    FieldGroup#GeneralInfo: {
        Data: [
            { Value: productName, Label: 'Product Name' },
            { Value: description, Label: 'Description' },
            { Value: category.categoryName, Label: 'Category' },
            { Value: supplier.supplierName, Label: 'Supplier' }
        ]
    },
 
    FieldGroup#StockPricing: {
        Data: [
            { Value: price, Label: 'Price' },
            { Value: stock, Label: 'Current Stock' },
            { Value: minStock, Label: 'Minimum Stock Level' },
            { Value: rating, Label: 'Customer Rating' },
            { Value: isAvailable, Label: 'Available for Sale' }
        ]
    },
 
    FieldGroup#Admin: {
        Data: [
            { Value: createdAt, Label: 'Created On' },
            { Value: createdBy, Label: 'Created By' },
            { Value: modifiedAt, Label: 'Last Modified' },
            { Value: modifiedBy, Label: 'Modified By' }
        ]
    }
};
 