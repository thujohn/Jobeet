<?php
// src/Ens/JobeetBundle/DataFixtures/ORM/LoadJobData.php
namespace Ens\JobeetBundle\DataFixtures\ORM;
 
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Ens\JobeetBundle\Entity\Job;
 
class LoadJobData extends AbstractFixture implements OrderedFixtureInterface
{
  public function load(ObjectManager $em)
  {
    $job_sensio_labs = new Job();
    $job_sensio_labs->setCategory($em->merge($this->getReference('category-programming')));
    $job_sensio_labs->setType('full-time');
    $job_sensio_labs->setCompany('Sensio Labs');
    $job_sensio_labs->setLogo('sensio-labs.gif');
    $job_sensio_labs->setUrl('http://www.sensiolabs.com/');
    $job_sensio_labs->setPosition('Web Developer');
    $job_sensio_labs->setLocation('Paris, France');
    $job_sensio_labs->setDescription('You\'ve already developed websites with symfony and you want to work with Open-Source technologies. You have a minimum of 3 years experience in web development with PHP or Java and you wish to participate to development of Web 2.0 sites using the best frameworks available.');
    $job_sensio_labs->setHowToApply('Send your resume to fabien.potencier [at] sensio.com');
    $job_sensio_labs->setIsPublic(true);
    $job_sensio_labs->setIsActivated(true);
    $job_sensio_labs->setToken('job_sensio_labs');
    $job_sensio_labs->setEmail('job@example.com');
    $job_sensio_labs->setExpiresAt(new \DateTime('2012-12-10'));
 
    $job_extreme_sensio = new Job();
    $job_extreme_sensio->setCategory($em->merge($this->getReference('category-design')));
    $job_extreme_sensio->setType('part-time');
    $job_extreme_sensio->setCompany('Extreme Sensio');
    $job_extreme_sensio->setLogo('extreme-sensio.gif');
    $job_extreme_sensio->setUrl('http://www.extreme-sensio.com/');
    $job_extreme_sensio->setPosition('Web Designer');
    $job_extreme_sensio->setLocation('Paris, France');
    $job_extreme_sensio->setDescription('Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in.');
    $job_extreme_sensio->setHowToApply('Send your resume to fabien.potencier [at] sensio.com');
    $job_extreme_sensio->setIsPublic(true);
    $job_extreme_sensio->setIsActivated(true);
    $job_extreme_sensio->setToken('job_extreme_sensio');
    $job_extreme_sensio->setEmail('job@example.com');
    $job_extreme_sensio->setExpiresAt(new \DateTime('2012-12-10'));

    $job_expired = new Job();
    $job_expired->setCategory($em->merge($this->getReference('category-programming')));
    $job_expired->setType('full-time');
    $job_expired->setCompany('Sensio Labs');
    $job_expired->setLogo('sensio-labs.gif');
    $job_expired->setUrl('http://www.sensiolabs.com/');
    $job_expired->setPosition('Web Developer Expired');
    $job_expired->setLocation('Paris, France');
    $job_expired->setDescription('Lorem ipsum dolor sit amet, consectetur adipisicing elit.');
    $job_expired->setHowToApply('Send your resume to lorem.ipsum [at] dolor.sit');
    $job_expired->setIsPublic(true);
    $job_expired->setIsActivated(true);
    $job_expired->setToken('job_expired');
    $job_expired->setEmail('job@example.com');
    $job_expired->setCreatedAt(new \DateTime('2005-12-01'));

    for($i = 100; $i <= 130; $i++)
    {
        $job = new Job();
        $job->setCategory($em->merge($this->getReference('category-programming')));
        $job->setType('full-time');
        $job->setCompany('Company '.$i);
        $job->setPosition('Web Developer');
        $job->setLocation('Paris, France');
        $job->setDescription('Lorem ipsum dolor sit amet, consectetur adipisicing elit.');
        $job->setHowToApply('Send your resume to lorem.ipsum [at] dolor.sit');
        $job->setIsPublic(true);
        $job->setIsActivated(true);
        $job->setToken('job_'.$i);
        $job->setEmail('job@example.com');
 
        $em->persist($job);
    }
 
    $em->persist($job_sensio_labs);
    $em->persist($job_extreme_sensio);
    $em->persist($job_expired);
 
    $em->flush();
  }
 
  public function getOrder()
  {
    return 2; // the order in which fixtures will be loaded
  }
}