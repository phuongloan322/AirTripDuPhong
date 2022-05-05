package airtrip.airtrip.repository;//package airtrip.airtrip.repository;

import airtrip.airtrip.entity.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogRepository extends JpaRepository<Blog, Long> {

    @Query(value = "select t from Blog t where t.account.accountId = ?1")
    List<Blog> getBlogByAccount(long accId);

    @Query(value = "select t from Blog t order by t.blogId desc")
    List<Blog> getBlogNew();

    @Query(value = "select t from Blog t order by t.blogId desc")
    Page<Blog> getBlogAllAdmin(Pageable pageable);
}
