package com.soheibKehal.CashApi.repository;

import com.soheibKehal.CashApi.Entity.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource
public interface ProductRepository extends CrudRepository<Product, Long>{

}
