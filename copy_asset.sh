create_asset() {
    PACKAGE=$1
   
    # remove existing main dart files to avoid conflicting with the ones copied from asset
    rm packages/$PACKAGE/lib/main*
   
    # Copy the main dart files from the library to the package
    # This is needed because the main dart files are overridden by the ones
    # copied from the asset directory.
    #
    # The main dart files are the entry point for the application.
    cp lib/main_{chiron_demo,anton_paar_development,mf_{development,production},tl_{development,production}}.dart packages/$PACKAGE/lib/
   
    # replace the import statement in the main dart files to point to the package constant menu instead of the library constant menu
    sed -i "s/import 'package:flx_nocode_flutter\/constant\/menu\/menu.dart' as flx_nocode_flutter;/import 'package:$PACKAGE\/constant\/menu.dart' as $PACKAGE;/" packages/$PACKAGE/lib/main_{chiron_demo,anton_paar_development,mf_{development,production},tl_{development,production}}.dart

    # Replace all instances of 'flx_nocode_flutter.menu' with '$PACKAGE.menu' in the main dart files
    # This is needed to ensure that the correct menu is used for the application.
    #
    # The menu is used to define the navigation menu for the application.
    sed -i "s/flx_nocode_flutter\.menu/$PACKAGE\.menu/g" packages/$PACKAGE/lib/main_{chiron_demo,anton_paar_development,mf_{development,production},tl_{development,production}}.dart

    # Remove existing asset directory if it exists
    # Then copy the asset directory from the library to the package
    # This is needed because the asset directory is overridden by the one
    # copied from the library.
    #
    # The asset directory contains the images, fonts and other assets for the application.
    [ -d packages/$PACKAGE/asset ] && rm -rf packages/$PACKAGE/asset/
    cp -r asset/ packages/$PACKAGE/asset/

    # Copy the analysis options file to the package
    # This is needed to ensure that the analyzer tool
    # in IntelliJ and VS Code can correctly analyze the
    # package
    #
    # The analysis options file contains configuration
    # options for the analyzer tool.
    cp analysis_options.yaml packages/$PACKAGE/

    # Copy the .vscode directory to the package
    # This is needed to ensure that the code editor
    # settings are correctly applied to the package
    # when it is opened in the code editor.
    cp -r .vscode/ packages/$PACKAGE/

    
    # Copy the .gitignore file to the package
    # This is needed to ensure that the .gitignore file
    # is correctly applied to the package when it is cloned
    # from the repository.
    cp .gitignore packages/$PACKAGE/

    cp Makefile packages/$PACKAGE/
}   

create_asset flexurio_chiron_accounting
create_asset flexurio_chiron_business_trip
create_asset flexurio_chiron_company
create_asset flexurio_chiron_finance
create_asset flexurio_chiron_marketing
create_asset flexurio_chiron_material
create_asset flexurio_chiron_material_stock
create_asset flexurio_chiron_presence
create_asset flexurio_chiron_product
create_asset flexurio_chiron_product_stock
create_asset flexurio_chiron_purchase_order
create_asset flexurio_chiron_purchase_request
create_asset flexurio_chiron_sales_order
create_asset flexurio_chiron_tax
create_asset flexurio_chiron_tax
create_asset flexurio_chiron_ticket

