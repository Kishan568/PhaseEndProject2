IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Order] (
    [OrderID] int NOT NULL IDENTITY,
    [CustomerID] int NOT NULL,
    [PaymentID] int NULL,
    [ShippingID] int NULL,
    [Discount] int NULL,
    [Taxes] int NULL,
    [TotalAmount] int NULL,
    [isCompleted] bit NULL,
    [OrderDate] datetime2 NULL,
    [DIspatched] bit NULL,
    [DispatchedDate] datetime2 NULL,
    [Shipped] bit NULL,
    [ShippingDate] datetime2 NULL,
    [Deliver] bit NULL,
    [DeliveryDate] datetime2 NULL,
    [Notes] nvarchar(max) NOT NULL,
    [CancelOrder] bit NULL,
    CONSTRAINT [PK_Order] PRIMARY KEY ([OrderID])
);
GO

CREATE TABLE [Product] (
    [ProductID] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    [UnitPrice] decimal(18,2) NOT NULL,
    [UnitInStock] int NULL,
    [ProductAvailable] bit NULL,
    [ShortDescription] nvarchar(max) NOT NULL,
    [PicturePath] nvarchar(max) NOT NULL,
    [Note] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY ([ProductID])
);
GO

CREATE TABLE [OrderDetail] (
    [OrderDetailsID] int NOT NULL IDENTITY,
    [OrderID] int NOT NULL,
    [ProductID] int NOT NULL,
    [UnitPrice] decimal(18,2) NULL,
    [Quantity] int NULL,
    [OrderDate] datetime2 NULL,
    CONSTRAINT [PK_OrderDetail] PRIMARY KEY ([OrderDetailsID]),
    CONSTRAINT [FK_OrderDetail_Order_OrderID] FOREIGN KEY ([OrderID]) REFERENCES [Order] ([OrderID]) ON DELETE CASCADE,
    CONSTRAINT [FK_OrderDetail_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Product] ([ProductID]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_OrderDetail_OrderID] ON [OrderDetail] ([OrderID]);
GO

CREATE INDEX [IX_OrderDetail_ProductID] ON [OrderDetail] ([ProductID]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20230907193057_firstMIG', N'7.0.10');
GO

COMMIT;
GO

