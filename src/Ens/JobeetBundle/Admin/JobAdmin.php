<?php

namespace Ens\JobeetBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Validator\ErrorElement;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
use Ens\JobeetBundle\Entity\Job;
 
class JobAdmin extends Admin
{
    // setup the defaut sort column and order
    protected $datagridValues = array(
        '_sort_order' => 'DESC',
        '_sort_by' => 'created_at'
    );

    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper->add('category')
                   ->add('type', 'choice', array('choices' => Job::getTypes(), 'expanded' => true))
                   ->add('company')
                   ->add('file', 'file', array('label' => 'Company logo', 'required' => false))
                   ->add('url')
                   ->add('position')
                   ->add('location')
                   ->add('description')
                   ->add('how_to_apply')
                   ->add('is_public')
                   ->add('email')
                   ->add('is_activated')
                   ;
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper->add('category')
                       ->add('company')
                       ->add('position')
                       ->add('description')
                       ->add('is_activated')
                       ->add('is_public')
                       ->add('email')
                       ->add('expires_at')
                       ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper->addIdentifier('company')
                   ->add('position')
                   ->add('location')
                   ->add('url')
                   ->add('is_activated')
                   ->add('email')
                   ->add('category')
                   ->add('expires_at')
                   ->add('_action', 'actions', array(
                         'actions' => array(
                         'view' => array(),
                         'edit' => array(),
                         'delete' => array(),
                        )
                   ))
                   ;
    }

    protected function configureShowField(ShowMapper $showMapper)
    {
        $showMapper->add('category')
                   ->add('type')
                   ->add('company')
                   ->add('webPath', 'string', array('template' => 'EnsJobeetBundle:JobAdmin:list_image.html.twig'))
                   ->add('url')
                   ->add('position')
                   ->add('location')
                   ->add('description')
                   ->add('how_to_apply')
                   ->add('is_public')
                   ->add('is_activated')
                   ->add('token')
                   ->add('email')
                   ->add('expires_at')
                   ;
    }

    public function getBatchActions()
    {
        // retrieve the default (currently only the delete action) actions
        $actions = parent::getBatchActions();

        // check user permissions
        if($this->hasRoute('edit') && $this->isGranted('EDIT') && $this->hasRoute('delete') && $this->isGranted('DELETE')){
            $actions['extend'] = array(
                'label'            => 'Extend',
                'ask_confirmation' => true // If true, a confirmation will be asked before performing the action
            );

            $actions['deleteNeverActivated'] = array(
                'label'            => 'Delete never activated jobs',
                'ask_confirmation' => true // If true, a confirmation will be asked before performing the action
            );
        }

        return $actions;
    }
}