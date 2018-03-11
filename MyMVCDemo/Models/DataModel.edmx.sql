
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/08/2018 07:35:25
-- Generated from EDMX file: D:\NZ_NewStart_v2.0\Industry Connect\exercises\MyMVCDemo\MyMVCDemo\Models\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LINQExercises];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Staff_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Staff] DROP CONSTRAINT [FK_Staff_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_StaffAssignment_Staff]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StaffAssignment] DROP CONSTRAINT [FK_StaffAssignment_Staff];
GO
IF OBJECT_ID(N'[dbo].[FK_StaffAssignment_Store]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StaffAssignment] DROP CONSTRAINT [FK_StaffAssignment_Store];
GO
IF OBJECT_ID(N'[dbo].[FK_TransactionHead_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TransactionHead] DROP CONSTRAINT [FK_TransactionHead_Customer];
GO
IF OBJECT_ID(N'[dbo].[FK_TransactionHead_Staff]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TransactionHead] DROP CONSTRAINT [FK_TransactionHead_Staff];
GO
IF OBJECT_ID(N'[dbo].[FK_TransactionHead_Store]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TransactionHead] DROP CONSTRAINT [FK_TransactionHead_Store];
GO
IF OBJECT_ID(N'[dbo].[FK_TransactionLine_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TransactionLine] DROP CONSTRAINT [FK_TransactionLine_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_TransactionLine_TransactionHead]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TransactionLine] DROP CONSTRAINT [FK_TransactionLine_TransactionHead];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Customer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customer];
GO
IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO
IF OBJECT_ID(N'[dbo].[Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Role];
GO
IF OBJECT_ID(N'[dbo].[Staff]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Staff];
GO
IF OBJECT_ID(N'[dbo].[StaffAssignment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StaffAssignment];
GO
IF OBJECT_ID(N'[dbo].[Store]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Store];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[TransactionHead]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TransactionHead];
GO
IF OBJECT_ID(N'[dbo].[TransactionLine]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TransactionLine];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customer'
CREATE TABLE [dbo].[Customer] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(20)  NULL,
    [Address] varchar(50)  NULL,
    [Phone] varchar(20)  NULL
);
GO

-- Creating table 'Product'
CREATE TABLE [dbo].[Product] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(20)  NULL,
    [Price] decimal(19,4)  NULL
);
GO

-- Creating table 'Role'
CREATE TABLE [dbo].[Role] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [RoleName] varchar(20)  NULL
);
GO

-- Creating table 'Staff'
CREATE TABLE [dbo].[Staff] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(20)  NOT NULL,
    [Location] varchar(50)  NULL,
    [RoleID] int  NOT NULL,
    [IsActive] bit  NOT NULL
);
GO

-- Creating table 'Store'
CREATE TABLE [dbo].[Store] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(20)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'TransactionHead'
CREATE TABLE [dbo].[TransactionHead] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [CustomerID] int  NOT NULL,
    [StaffID] int  NOT NULL,
    [StoreID] int  NOT NULL,
    [date] datetime  NULL
);
GO

-- Creating table 'TransactionLine'
CREATE TABLE [dbo].[TransactionLine] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [HeaderID] int  NOT NULL,
    [ProductID] int  NOT NULL,
    [Quantity] int  NULL
);
GO

-- Creating table 'StaffAssignment'
CREATE TABLE [dbo].[StaffAssignment] (
    [Staff_ID] int  NOT NULL,
    [Store_ID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Customer'
ALTER TABLE [dbo].[Customer]
ADD CONSTRAINT [PK_Customer]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [PK_Product]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Role'
ALTER TABLE [dbo].[Role]
ADD CONSTRAINT [PK_Role]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Staff'
ALTER TABLE [dbo].[Staff]
ADD CONSTRAINT [PK_Staff]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Store'
ALTER TABLE [dbo].[Store]
ADD CONSTRAINT [PK_Store]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [ID] in table 'TransactionHead'
ALTER TABLE [dbo].[TransactionHead]
ADD CONSTRAINT [PK_TransactionHead]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'TransactionLine'
ALTER TABLE [dbo].[TransactionLine]
ADD CONSTRAINT [PK_TransactionLine]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Staff_ID], [Store_ID] in table 'StaffAssignment'
ALTER TABLE [dbo].[StaffAssignment]
ADD CONSTRAINT [PK_StaffAssignment]
    PRIMARY KEY CLUSTERED ([Staff_ID], [Store_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerID] in table 'TransactionHead'
ALTER TABLE [dbo].[TransactionHead]
ADD CONSTRAINT [FK_TransactionHead_Customer]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customer]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionHead_Customer'
CREATE INDEX [IX_FK_TransactionHead_Customer]
ON [dbo].[TransactionHead]
    ([CustomerID]);
GO

-- Creating foreign key on [ProductID] in table 'TransactionLine'
ALTER TABLE [dbo].[TransactionLine]
ADD CONSTRAINT [FK_TransactionLine_Product]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Product]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionLine_Product'
CREATE INDEX [IX_FK_TransactionLine_Product]
ON [dbo].[TransactionLine]
    ([ProductID]);
GO

-- Creating foreign key on [RoleID] in table 'Staff'
ALTER TABLE [dbo].[Staff]
ADD CONSTRAINT [FK_Staff_Role]
    FOREIGN KEY ([RoleID])
    REFERENCES [dbo].[Role]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Staff_Role'
CREATE INDEX [IX_FK_Staff_Role]
ON [dbo].[Staff]
    ([RoleID]);
GO

-- Creating foreign key on [StaffID] in table 'TransactionHead'
ALTER TABLE [dbo].[TransactionHead]
ADD CONSTRAINT [FK_TransactionHead_Staff]
    FOREIGN KEY ([StaffID])
    REFERENCES [dbo].[Staff]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionHead_Staff'
CREATE INDEX [IX_FK_TransactionHead_Staff]
ON [dbo].[TransactionHead]
    ([StaffID]);
GO

-- Creating foreign key on [StoreID] in table 'TransactionHead'
ALTER TABLE [dbo].[TransactionHead]
ADD CONSTRAINT [FK_TransactionHead_Store]
    FOREIGN KEY ([StoreID])
    REFERENCES [dbo].[Store]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionHead_Store'
CREATE INDEX [IX_FK_TransactionHead_Store]
ON [dbo].[TransactionHead]
    ([StoreID]);
GO

-- Creating foreign key on [HeaderID] in table 'TransactionLine'
ALTER TABLE [dbo].[TransactionLine]
ADD CONSTRAINT [FK_TransactionLine_TransactionHead]
    FOREIGN KEY ([HeaderID])
    REFERENCES [dbo].[TransactionHead]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionLine_TransactionHead'
CREATE INDEX [IX_FK_TransactionLine_TransactionHead]
ON [dbo].[TransactionLine]
    ([HeaderID]);
GO

-- Creating foreign key on [Staff_ID] in table 'StaffAssignment'
ALTER TABLE [dbo].[StaffAssignment]
ADD CONSTRAINT [FK_StaffAssignment_Staff]
    FOREIGN KEY ([Staff_ID])
    REFERENCES [dbo].[Staff]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Store_ID] in table 'StaffAssignment'
ALTER TABLE [dbo].[StaffAssignment]
ADD CONSTRAINT [FK_StaffAssignment_Store]
    FOREIGN KEY ([Store_ID])
    REFERENCES [dbo].[Store]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StaffAssignment_Store'
CREATE INDEX [IX_FK_StaffAssignment_Store]
ON [dbo].[StaffAssignment]
    ([Store_ID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------