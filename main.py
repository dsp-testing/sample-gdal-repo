from osgeo import gdal

def main():
    print("GDAL version:", gdal.__version__)

    # Open a sample dataset
    dataset = gdal.Open('https://raw.githubusercontent.com/OSGeo/gdal/master/autotest/gcore/data/byte.tif')
    if not dataset:
        print("Failed to open dataset")
        return

    # Get raster band
    band = dataset.GetRasterBand(1)
    if not band:
        print("Failed to get raster band")
        return

    # Read raster data
    data = band.ReadAsArray()
    print("Raster data:", data)

if __name__ == "__main__":
    main()
