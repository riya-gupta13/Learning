package com.riya.spring.boot.demo;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.junit4.SpringRunner;

import com.riya.spring.boot.demo.entities.Product;
import com.riya.spring.boot.demo.repos.ProductRepository;

@RunWith(SpringRunner.class)
@SpringBootTest
class DemoApplicationTests {
	
	@Autowired
	ApplicationContext context;
	
	@Test
	public void saveProduct() {
		ProductRepository productRepository =context.getBean(ProductRepository.class);
		Product p=new Product();
		p.setId(1L);
		p.setName("Mac");
		p.setDescription("Apple");
		p.setPrice(1000d);
		
//		productRepository.save(p);
//		
//		Optional<Product> result =productRepository.findById(1L);
//		if (result.isPresent()){
//			System.out.println(result.toString());
//		}
//		
////		updating
//		result.get().setPrice(1500d);
//		productRepository.save(result.get());
//		productRepository.findAll().forEach(pr->{System.out.println(pr.getPrice());});
//		
		System.out.println(productRepository.findByName("Mac"));
		System.out.println(productRepository.findByPrice(1500d));
		System.out.println(productRepository.findByNameAndPrice("Mac",1500d));
	}

}
