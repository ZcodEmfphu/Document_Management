package com.boot.music.data;

import java.sql.Clob;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.boot.music.entity.Document;
import com.boot.music.entity.Status;
import com.boot.music.entity.User;
import com.boot.music.entity.Version;
import com.boot.music.repositories.DocumentRepo;
import com.boot.music.repositories.StatusRepo;
import com.boot.music.repositories.UserRepo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.transaction.Transaction;



@Configuration
public class Database {
    private static final Logger logger= LoggerFactory.getLogger(Database.class);
    @Bean
    CommandLineRunner initDatabase( UserRepo userRe, StatusRepo statRepo,DocumentRepo docRe) {

        return new CommandLineRunner( ) {

            @Override
            public void run(String... args) throws Exception {
                SimpleDateFormat sdf= new SimpleDateFormat("DD-MM-YYYY");
//
//			User u= new User("hoa hau", "1@gmail.com", "0855555", "1234ds", 0, 0);
////			userRe.save(u);
////			userRe.save(new User("hoa hau2", "2@gmail.com", "08666666", "1234ds", 0, 0));
//			Document d= new Document("Phuong an phong tranh thien tai", "Nham doi pho voi tinh hinh thien tai trong tuong lai.... ",
//					sdf.parse("19-5-2024"), sdf.parse("19-5-2026"),u);
//
//			/*
//			* save to DB using repository examples since I use unique constrain on status
//			* name, run the save status code 1 time only, or delete the status table
//			*/
//			Status pending=new Status("PENDING");
//			statRepo.save(pending);
//			statRepo.save(new Status("HIDDEN"));
//			statRepo.save(new Status("APPROVED"));
//			statRepo.save(new Status("REJECTED"));
//
///*
//* save using persistence, see file xml in resources->META-INF
//* for each class in entity, add the following structure to persistence-unit
//* <class>com.boot.music.entity.User</class>
//* then parse in unit name as argument for createEntityManagerFactory();
//*/
//			EntityManagerFactory emf= Persistence.createEntityManagerFactory("dms");
//			EntityManager em=emf.createEntityManager();
//			EntityTransaction t= em.getTransaction();
//			t.begin();
//			em.persist(u);
//			t.commit();
//			em.close();
//			emf.close();
//			//end
//			Version v= new Version("ver1", sdf.parse("19-5-2024"), sdf.parse("19-5-2024"), d, "phuong an neu ra nhung diem can luu y....");
//			d.getVersionList().add(v);
//			docRe.save(d);
//			docRe.findByStatusID((short)1);
//			logger.info(docRe.findByStatusID((short)1).get(0).getTitle());
//

//			Locale locale = new Locale("vi", "VN");
                //			NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
//			Category c1= new Category("Trinh cong son1");
////			cate.save(c1);
////			Category c= cate.findById(2).get();
////			Region r= re.findById(1).get();
////			Song s1= new Song("song1","urlimg","mp3","lyric", c,r);
////			Artist ar= aRe.findById(5).get();
////			s1.getArtist().add(ar);
////			songRe.save(s1);
////			songRe.findAll().get(0).getId();
//////
////			System.out.println(songRe.findAll().get(0).getId());
//			EntityManagerFactory em= Persistence.createEntityManagerFactory("music");
//			EntityManager e=em.createEntityManager();
//
////			Query q=	e.createQuery("Select  title from Song where id=?1");
////			q.setParameter(1, 15);
////		//	System.out.println(q.getSingleResult());
////			Query q1=e.createQuery("select id, categoryName from Category",Category[].class);
////			List<Category[]> l=q1.getResultList();
////			for (Object[] r : l) {
////
////			}
////			Object[] o1=l.get(1);
////
////			Song s=e.find(Song.class, 1);
////			System.out.println(o1[1]);
//			List<Song> l1=e.createQuery("Select s.id from Song s join s.artist a where s.id=1",Song.class).getResultList();
////			Category c3= l1.get(1);
//
////
////			List<SongDTO> l3=e.createQuery("select a.id,a.name,s.id,s.title,s.img,s.mp3_link,s.lyrics,s.cate,s.reg"
////					+ "from Artist a,Song s  where s.id=p.song_id and s.id=1" ,SongDTO.class).getResultList();
////			List<SongDTO> l4=e.createQuery("Select new com.boot.music.dto.SongDTO("
////					+ "a.id as artistID, a.name as artistName,s.id as songID, s.title as title, s.img as songIMG, s.mp3_link as mp3_link,"
////					+ "s.lyrics as lyric, s.category as cateID, s.reg as regionID ) from  Song s join s.artist a where (s.title like '%nam%' or a.name like '%nam%') ",SongDTO.class).getResultList().subList(0, 10);
////			System.out.println(l4.size());
////			for (SongDTO songDTO : l4) {
////				System.out.println(songDTO.getArtistID()+"  "+songDTO.getSongID()+"   "+ songDTO.getArtistName()+"   "+songDTO.getTitle() );
////			System.out.println();
//
//
//
////			}
//			Role r=e.find(Role.class, "1");
//			User c= e.find(User.class, 1);
//
////			acRe.save(c);
//			Query q=e.createQuery(" from Account",Account.class);
////			q.setParameter(1, "Holland");
////			q.setParameter(2, "ten@gmail.com");
////			q.setParameter(3, "hdasghjd");
//			//User i=(User) q.getResultList().get(0);



            }
        };
    }
}