USE [aromatherapy_massage];


-- Insert some roles
INSERT INTO [Role] (role_name) 
VALUES 
('SYSADMIN'),
('MANAGER'), 
('SUPERVISOR'), 
('STAFF');

-- Insert some permission group
INSERT INTO [PermissionGroup] 
VALUES
('post'),
('employee'),
('service'),
('course'),
('permissionGroup'),
('permission'),
('role');
-- Insert some permissions
INSERT INTO [Permission] ([permission_name], [permission_group_name]) 
VALUES 
('POST_CREATE', 'post'),
('POST_READ', 'post'),
('POST_READ_ALL', 'post'),
('POST_DELETE', 'post'),
('POST_UPDATE', 'post'),
('SERVICE_CREATE', 'service'),
('SERVICE_READ', 'service'),
('SERVICE_READ_ALL', 'service'),
('SERVICE_DELETE', 'service'),
('SERVICE_UPDATE', 'service'), 
('COURSE_CREATE', 'course'),
('COURSE_READ', 'course'),
('COURSE_READ_ALL', 'course'),
('COURSE_DELETE', 'course'),
('COURSE_UPDATE', 'course'),
('ROLE_CREATE', 'role'),
('ROLE_READ', 'role'),
('ROLE_READ_ALL', 'role'),
('ROLE_DELETE', 'role'),
('ROLE_UPDATE', 'role'),
('PERMISSION_GROUP_CREATE', 'permissionGroup'),
('PERMISSION_GROUP_READ', 'permissionGroup'),
('PERMISSION_GROUP_READ_ALL', 'permissionGroup'),
('PERMISSION_GROUP_UPDATE', 'permissionGroup'),
('PERMISSION_GROUP_DELETE', 'permissionGroup'),
('PERMISSION_CREATE', 'permission'),
('PERMISSION_READ', 'permission'),
('PERMISSION_READ_ALL', 'permission'),
('PERMISSION_UPDATE', 'permission'),
('PERMISSION_DELETE', 'permission');

-- Insert employees
INSERT INTO [Employee] ([employee_name], [employee_title], [employee_info], [employee_img_src], [employee_username], [employee_hashed_password], [employee_is_locked], [employee_role_name], [employee_join_date])
VALUES 
('John Doe', 'Massage Therapist', 'John Doe has over 10 years of experience in therapeutic massage. He specializes in Swedish massage and deep tissue techniques, providing a relaxing and rejuvenating experience for clients. John is known for his attention to detail and personalized care, ensuring that each client receives the best possible treatment.', '/resources/static/img/john_doe.jpg', 'jdoe', '$2a$10$HjrS8X./HzT2FImIY6Rrz.jqnOiqz03L7JpEy2T7STxiqvMZ.Uw72', 0, 'staff', GETDATE()),
('Jane Smith', 'Aromatherapy Specialist', 'Jane Smith is an expert in aromatherapy with a focus on holistic health. She combines traditional aromatherapy practices with modern wellness techniques to help clients achieve balance and well-being. Jane holds certifications in essential oil therapy and is passionate about educating clients on the benefits of natural healing.', '/resources/static/img/jane_smith.jpg', 'jsmith', '$2a$10$HjrS8X./HzT2FImIY6Rrz.jqnOiqz03L7JpEy2T7STxiqvMZ.Uw72', 0, 'staff', GETDATE()),
('Robert Brown', 'Spa Manager', 'Robert Brown oversees the operations of the spa and ensures high-quality service. With a background in hospitality management, Robert brings a wealth of knowledge in customer service and spa administration. He is dedicated to maintaining a welcoming environment and upholding the highest standards of service for all clients.', '/resources/static/img/robert_brown.jpg', 'rbrown', '$2a$10$HjrS8X./HzT2FImIY6Rrz.jqnOiqz03L7JpEy2T7STxiqvMZ.Uw72', 0, 'supervisor', GETDATE()),
('Emily White', 'Manager', 'Emily White is a seasoned manager with expertise in leading teams and driving operational excellence. She has a strong background in project management and is committed to delivering exceptional results for clients. Emily is known for her leadership skills and her ability to inspire and motivate her team.', '/resources/static/img/emily_white.jpg', 'ewhite', '$2a$10$HjrS8X./HzT2FImIY6Rrz.jqnOiqz03L7JpEy2T7STxiqvMZ.Uw72', 1, 'manager', GETDATE()),
(NULL, NULL, NULL, NULL, 'sysadmin', '$2a$10$HjrS8X./HzT2FImIY6Rrz.jqnOiqz03L7JpEy2T7STxiqvMZ.Uw72', 0, 'sysadmin', GETDATE());;



-- Insert courses
INSERT INTO [Course] ([employee_id], [course_title], [course_content], [course_info], [course_img_src], [course_price], [course_create_date])
VALUES 
(1, 'Beginner Massage Techniques', 'This comprehensive course is designed for beginners who want to learn the fundamentals of massage therapy. The curriculum covers a range of basic techniques, including Swedish massage, effleurage, petrissage, and tapotement. Students will learn about the human anatomy, focusing on muscles and soft tissues. The course emphasizes the importance of understanding client needs and communication...', '2 weeks', '/resources/static/img/courses/massage_basics.jpg', 599.00 , '2024-06-01 10:00:00'),
(2, 'Advanced Aromatherapy', 'This advanced course delves into the art and science of aromatherapy, exploring the therapeutic uses of essential oils. Participants will study the chemical properties of oils, learn about their effects on the body and mind, and discover how to blend oils for various treatments...', '2 weeks', '/resources/static/img/courses/aromatherapy_advanced.jpg', 899.00, '2024-06-26 10:00:00'),
(3, 'Spa Management 101', 'This introductory course covers the essentials of managing a spa. It is designed for aspiring spa managers, current managers looking to refine their skills, and entrepreneurs planning to start a spa business. The curriculum includes business strategy development, financial planning, marketing, and client relationship management. Students will learn about the importance of creating a serene and...', '4 weeks', '/resources/static/img/courses/spa_management.jpg', 1299.00, '2024-07-15 10:00:00'),
(1, 'Deep Tissue Massage', 'The Deep Tissue Massage course offers an in-depth exploration of techniques designed to relieve tension and alleviate pain in the deeper layers of muscles and connective tissues. Students will learn about the anatomy of the musculoskeletal system, focusing on common areas of tension and injury. The course includes practical training on techniques such as myofascial release, trigger point therapy, and deep muscle stripping...', '3 weeks', '/resources/static/img/courses/deep_tissue.jpg', 999.00, '2024-07-22 10:00:00'),
(2, 'Herbal Treatments and Remedies', 'In this course, participants will explore the use of herbs in holistic treatments and remedies. The curriculum covers the history of herbal medicine, the properties and uses of different herbs, and methods for preparing herbal remedies. Students will learn how to integrate herbs into treatments for various conditions, such as skin issues, respiratory ailments, and digestive problems. The course also includes practical sessions on creating herbal infusions...', '4 weeks', '/resources/static/img/courses/herbal_treatments.jpg', 1299.00, '2024-08-01 10:00:00');

-- Insert post statuses
INSERT INTO [PostStatus] ([post_status_name])
VALUES ('draft'), ('unpublished'), ('published');

-- Insert posts
INSERT INTO [Post] ([employee_id], [post_status], [post_last_update_employee], [post_title], [post_content], [post_intro_img_src], [post_excerpt], [post_excerpt_img_src])
VALUES 
(1, 3, 1, 'The Benefits of Regular Massage Therapy', 'Regular massage therapy has numerous benefits for both physical and mental health. Physically, it helps relieve muscle tension, improve circulation, and promote overall relaxation. By manipulating muscles and soft tissues, massage therapy can help alleviate chronic pain conditions such as back pain, arthritis, and fibromyalgia. Moreover, it enhances flexibility and mobility, making it particularly beneficial for athletes and individuals recovering from injuries. Mentally, massage therapy is known to reduce stress and anxiety levels. The calming effects of massage help lower cortisol, the stress hormone, while boosting serotonin and dopamine, which are chemicals that promote happiness and relaxation. This therapeutic practice also supports the immune system by enhancing lymphatic circulation, which helps the body remove toxins and fight off illness. Incorporating regular massage sessions into your routine can lead to a better quality of sleep, increased energy levels, and an overall sense of well-being. Whether you are seeking relief from physical discomfort or looking to reduce stress, massage therapy offers a natural and holistic approach to health care.', '/resources/static/img/posts/massage_benefits.jpg', 'Discover how regular massage therapy can improve your physical and mental health, reduce stress, and enhance overall well-being.', '/resources/static/img/posts/massage_benefits_excerpt.jpg'),
(2, 3, 2, 'Exploring the Healing Powers of Aromatherapy', 'Aromatherapy, the practice of using essential oils for therapeutic purposes, has been around for centuries. This holistic healing method utilizes the aromatic compounds of plants to improve physical, emotional, and spiritual well-being. Essential oils are extracted from various parts of plants, including flowers, leaves, and roots, and each oil has unique properties that can be used to treat specific conditions. For example, lavender oil is renowned for its calming and relaxing effects, making it a popular choice for reducing stress and promoting better sleep. Peppermint oil, on the other hand, is invigorating and can help alleviate headaches and digestive issues. The benefits of aromatherapy extend beyond physical health; the scents can also influence mood and emotions. Certain oils, such as rosemary and lemon, are known to enhance focus and concentration, while others, like rose and ylang-ylang, can help lift spirits and improve emotional balance. Aromatherapy can be integrated into daily life through various methods, such as diffusing oils into the air, adding them to baths, or using them in massage therapy. This practice not only offers a natural way to support health but also enriches daily life with the soothing and uplifting effects of nature''s own remedies.', '/resources/static/img/posts/aromatherapy_healing.jpg', 'Learn about the healing powers of aromatherapy and how essential oils can enhance your health and well-being.', '/resources/static/img/posts/aromatherapy_healing_excerpt.jpg'),
(3, 3, 3, 'The Importance of a Holistic Spa Experience', 'A holistic spa experience focuses on the well-being of the whole person, integrating body, mind, and spirit. This approach goes beyond traditional beauty and relaxation treatments by emphasizing the interconnectedness of all aspects of health. Holistic spa services often include a combination of massage therapy, aromatherapy, skincare, and meditation or mindfulness practices. The goal is not just to provide temporary relief from stress or tension but to foster a deeper sense of balance and harmony in one''s life. By addressing both physical and emotional needs, holistic spa treatments can lead to improved mental clarity, emotional stability, and a greater sense of overall well-being. For instance, combining a massage with aromatherapy can enhance the relaxing effects of both treatments, while mindfulness exercises can help clients cultivate a peaceful and focused state of mind. The environment in a holistic spa is also designed to support healing and relaxation, with soothing music, calming scents, and a serene atmosphere. This holistic approach to spa services recognizes that true health and beauty come from within and that nurturing the mind and spirit is just as important as caring for the body. Whether you are seeking to rejuvenate your skin, relieve muscle tension, or simply escape the stresses of daily life, a holistic spa experience offers a comprehensive path to wellness.', '/resources/static/img/posts/holistic_spa.jpg', 'Discover the benefits of a holistic spa experience that nurtures your body, mind, and spirit for complete well-being.', '/resources/static/img/posts/holistic_spa_excerpt.jpg'),
(1, 3, 1, 'Deep Tissue Massage: Benefits and Techniques', 'Deep tissue massage is a technique that focuses on the deeper layers of muscle and connective tissue in the body. It is particularly beneficial for individuals who experience chronic pain, muscle tension, or are recovering from injury. This type of massage uses slow, deliberate strokes and deep pressure to target specific areas of tension and pain. Unlike lighter forms of massage, deep tissue massage works to break down scar tissue and adhesions, which can cause pain and limited movement. It also helps increase blood flow and reduce inflammation in the affected areas. The techniques used in deep tissue massage include myofascial release, trigger point therapy, and deep muscle stripping, all of which are designed to release chronic muscle tension and restore mobility. While the pressure applied can sometimes be intense, it is essential to communicate with the therapist to ensure the pressure is within a comfortable range. The benefits of deep tissue massage are not only physical; many clients report a significant reduction in stress and anxiety levels following a session. This is likely due to the release of tension held within the body, which can have a profound effect on mental and emotional well-being. Whether you are an athlete looking to enhance your performance or someone seeking relief from chronic pain, deep tissue massage offers a powerful and therapeutic option.', '/resources/static/img/posts/deep_tissue_massage.jpg', 'Explore the benefits and techniques of deep tissue massage, a therapeutic method for relieving chronic pain and tension.', '/resources/static/img/posts/deep_tissue_massage_excerpt.jpg'),
(2, 3, 2, 'Herbal Remedies for Everyday Ailments', 'Herbal remedies have been used for centuries to treat a wide range of ailments and promote overall health. They offer a natural alternative to conventional medicines, with a focus on healing the body from within. Common herbs like chamomile, peppermint, and ginger are often used to treat digestive issues, soothe inflammation, and alleviate pain. Chamomile, for example, is known for its calming properties and is commonly used to relieve stress and anxiety. Peppermint can help soothe stomach discomfort and headaches, while ginger is widely used for its anti-inflammatory and anti-nausea effects. In addition to these common herbs, there are countless others with unique healing properties. For instance, echinacea is popular for boosting the immune system and preventing colds, while turmeric is celebrated for its powerful anti-inflammatory and antioxidant effects. Herbal remedies can be consumed in various forms, including teas, tinctures, capsules, and topical applications. It is essential to use herbs correctly and consult with a healthcare professional, especially if you are pregnant, nursing, or taking other medications. The growing interest in herbal medicine reflects a broader desire for natural and holistic approaches to health. By incorporating herbal remedies into your daily routine, you can support your body''s natural healing processes and enjoy the benefits of nature''s medicine.', '/resources/static/img/posts/herbal_remedies.jpg', 'Learn about herbal remedies for common ailments and how to incorporate them into your daily health routine.', '/resources/static/img/posts/herbal_remedies_excerpt.jpg');

-- Insert services
INSERT INTO [Service] ([employee_id], [service_title], [service_info], [service_img_src], [service_price], [service_create_time])
VALUES 
(1, 'Full Body Massage', '30 minutes', '/resources/static/img/full_body_massage.jpg', 75.00, '2024-08-01 10:00:00'),
(2, 'Aromatherapy Massage', '60 minutes', '/resources/static/img/aromatherapy_massage.jpg', 85.00, '2024-08-01 10:30:00'),
(3, 'Deep Tissue Massage', '60 minutes', '/resources/static/img/deep_tissue_massage.jpg', 90.00, '2024-08-01 11:00:00'),
(1, 'Hot Stone Massage', '60 minutes', '/resources/static/img/hot_stone.jpg', 100.00, GETDATE()),
(2, 'Swedish Massage', '90 minutes', '/resources/static/img/swedish.jpg', 120.00, GETDATE()),
(3, 'Thai Massage', '60 minutes', '/resources/static/img/thai.jpg', 110.00, GETDATE()),
(1, 'Reflexology', '45 minutes', '/resources/static/img/reflexology.jpg', 70.00, GETDATE()),
(2, 'Shiatsu Massage', '60 minutes', '/resources/static/img/shiatsu.jpg', 95.00, GETDATE()),
(3, 'Prenatal Massage', '60 minutes', '/resources/static/img/prenatal.jpg', 105.00, GETDATE()),
(1, 'Sports Massage', '75 minutes', '/resources/static/img/sports.jpg', 115.00, GETDATE()),
(2, 'Lymphatic Drainage', '60 minutes', '/resources/static/img/lymphatic.jpg', 90.00, GETDATE()),
(3, 'Trigger Point Therapy', '60 minutes', '/resources/static/img/trigger_point.jpg', 85.00, GETDATE()),
(1, 'Cupping Therapy', '45 minutes', '/resources/static/img/cupping.jpg', 75.00, GETDATE()),
(2, 'Deep Relaxation Massage', '90 minutes', '/resources/static/img/deep_relaxation.jpg', 130.00, GETDATE()),
(3, 'Reiki Healing', '60 minutes', '/resources/static/img/reiki.jpg', 80.00, GETDATE());

INSERT INTO [LoginHistory] (username, login_status, login_device, login_ip_address, login_attempt, login_create_time)
VALUES 
('jdoe', 1, 'Desktop', '192.168.1.1', 1, GETDATE()),
('jdoe', 1, 'Mobile', '192.168.1.2', 1, GETDATE()),
('jdoe', 0, 'Tablet', '192.168.1.3', 2, GETDATE()),
('jsmith', 1, 'Desktop', '192.168.1.4', 1, GETDATE()),
('jsmith', 0, 'Mobile', '192.168.1.5', 1, GETDATE()),
('rbrown', 1, 'Desktop', '192.168.1.6', 1, GETDATE()),
('rbrown', 1, 'Mobile', '192.168.1.7', 1, GETDATE()),
('jsmith', 0, 'Mobile', '192.168.1.5', 2, GETDATE()),
('rbrown', 1, 'Desktop', '192.168.1.6', 1.0, GETDATE()),
('rbrown', 1, 'Mobile', '192.168.1.7', 3, GETDATE()),
('ewhite', 1, 'Mobile', '192.168.1.7', 4, GETDATE())
