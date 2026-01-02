CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '=============================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=============================================================';

		PRINT '-------------------------------------------------------------';
		PRINT 'Loading Tables';
		PRINT '-------------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.customers';
		TRUNCATE TABLE bronze.customers;
	
		PRINT '>> Inserting Data Into: bronze.customers';
		BULK INSERT bronze.customers
		FROM 'C:\Users\nicks\OneDrive\Documents\Ecommerce Website SQL Analysis\Customers.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ----------';

		--------------------------------------------------------
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.order_details';
		TRUNCATE TABLE bronze.order_details;

		PRINT '>> Inserting Data Into: bronze.order_details';
		BULK INSERT bronze.order_details
		FROM 'C:\Users\nicks\OneDrive\Documents\Ecommerce Website SQL Analysis\Order Details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ----------';

		--------------------------------------------------------
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.orders';
		TRUNCATE TABLE bronze.orders;

		PRINT '>> Inserting Data Into: bronze.orders';
		BULK INSERT bronze.orders
		FROM 'C:\Users\nicks\OneDrive\Documents\Ecommerce Website SQL Analysis\Orders.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ----------';

	    --------------------------------------------------------
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.products';
		TRUNCATE TABLE bronze.products;

		PRINT '>> Inserting Data Into: bronze.products';
		BULK INSERT bronze.products
		FROM 'C:\Users\nicks\OneDrive\Documents\Ecommerce Website SQL Analysis\Products.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ----------';

		--------------------------------------------------------
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.returns';
		TRUNCATE TABLE bronze.returns;

		PRINT '>> Inserting Data Into: bronze.returns';
		BULK INSERT bronze.returns
		FROM 'C:\Users\nicks\OneDrive\Documents\Ecommerce Website SQL Analysis\Returns.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> ----------';

		SET @batch_end_time = GETDATE();
		PRINT '==========================================';
		PRINT 'Loading Bronze Layer is Completed';
		PRINT '    - Total Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '==========================================';
	END TRY
	BEGIN CATCH
		PRINT '===========================================';
		PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT '===========================================';
	END CATCH
END