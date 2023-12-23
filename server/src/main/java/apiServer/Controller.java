package apiServer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class Controller {
    @Autowired
    private  SupplierService supplierService;
    @GetMapping("/suppliers.json")
    public List<Supplier> get (){
        return supplierService.findAll();
    }
}
