package com.soheibKehal.CashApi.repository;

import com.soheibKehal.CashApi.Entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource
public interface RestRepository extends CrudRepository<User, Long> {
	
	User findByUsername(String username);
}
