/***************************************************************
 * Name:      XmlSerializer.cpp
 * Purpose:   Implements XML serializer and related classes
 * Author:    Michal Bližňák (michal.bliznak@tiscali.cz)
 * Created:   2007-08-28
 * Copyright: Michal Bližňák
 * License:   wxWidgets license (www.wxwidgets.org)
 * Notes:
 **************************************************************/

#include "XmlSerializer.h"

#include <wx/listimpl.cpp>
#include <wx/wfstream.h>
#include <wx/arrimpl.cpp>

WX_DEFINE_EXPORTED_OBJARRAY(RealPointArray);

WX_DEFINE_EXPORTED_LIST(PropertyList);
WX_DEFINE_EXPORTED_LIST(SerializableList);
WX_DEFINE_EXPORTED_LIST(RealPointList);

/////////////////////////////////////////////////////////////////////////////////////
// xsProperty class /////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

IMPLEMENT_DYNAMIC_CLASS(xsProperty, wxObject);

/////////////////////////////////////////////////////////////////////////////////////
// xsSerializable class /////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

IMPLEMENT_DYNAMIC_CLASS(xsSerializable, wxObject);

//long xsSerializable::m_nItemCounter = 0;

// constructor and destructor ///////////////////////////////////////////////////////

xsSerializable::xsSerializable()
{
    m_pParentItem = NULL;
    m_fSerialize = true;
    m_nId = -1;
}

xsSerializable::xsSerializable(xsSerializable& obj)
{
    m_pParentItem = obj.m_pParentItem;
    m_fSerialize = obj.m_fSerialize;
    m_nId = obj.m_nId;
}

xsSerializable::~xsSerializable()
{
    m_lstProperties.DeleteContents(true);
    m_lstProperties.Clear();

    m_lstChildItems.DeleteContents(true);
    m_lstChildItems.Clear();
}

// public functions /////////////////////////////////////////////////////////////////

void xsSerializable::AddChild(xsSerializable* child)
{
    wxASSERT(child);

    if( child )
    {
        child->m_pParentItem = this;
        m_lstChildItems.Append(child);
    }
}

void xsSerializable::Reparent(xsSerializable* parent)
{
    if(m_pParentItem)
    {
        m_pParentItem->m_lstChildItems.DeleteObject(this);
    }

    if(parent)
    {
        parent->AddChild(this);
    }
    else
        m_pParentItem = NULL;
}

xsSerializable* xsSerializable::GetFirstChild()
{
    wxSerializableListNode* node = m_lstChildItems.GetFirst();
    if(node)return node->GetData();
    else
        return NULL;
}

xsSerializable* xsSerializable::GetLastChild()
{
    wxSerializableListNode* node = m_lstChildItems.GetLast();
    if(node)return node->GetData();
    else
        return NULL;
}

xsSerializable* xsSerializable::GetSibbling()
{
    wxASSERT( m_pParentItem );

    if( m_pParentItem )
    {
        wxSerializableListNode* node = m_pParentItem->GetChildren().GetFirst();
        while(node)
        {
            if( node->GetData() == this )
            {
                wxSerializableListNode* sibblingNode = node->GetNext();
                if( sibblingNode )return sibblingNode->GetData();
            }
            node = node->GetNext();
        }
    }

    return NULL;
}

void xsSerializable::AddProperty(xsProperty* property)
{
    if(property)
    {
        if(!GetProperty(property->m_sFieldName))
        {
            m_lstProperties.Append(property);
        }
    }
}

xsProperty* xsSerializable::GetProperty(const wxString& field)
{
    wxPropertyListNode* node = m_lstProperties.GetFirst();
    while(node)
    {
        if(node->GetData()->m_sFieldName == field)return node->GetData();
        node = node->GetNext();
    }
    return NULL;
}

void xsSerializable::EnablePropertySerialization(const wxString& field, bool enab)
{
    xsProperty* property = GetProperty(field);
    if(property)
    {
        property->m_fSerialize = enab;
    }
}

bool xsSerializable::IsPropertySerialized(const wxString& field)
{
    xsProperty* property = GetProperty(field);
    if(property)
    {
        return property->m_fSerialize;
    }
    return false;
}

wxXmlNode* xsSerializable::SerializeObject(wxXmlNode* node)
{
	if(!node || (node->GetName() != wxT("object")))
	{
		node = new wxXmlNode(wxXML_ELEMENT_NODE, wxT("object"));
#if wxCHECK_VERSION(2, 8, 0)
		node->AddProperty(new wxXmlProperty(wxT("type"), this->GetClassInfo()->GetClassName()));
#else // replacement code for old version
		node->AddProperty(new wxXmlProperty(wxT("type"), this->GetClassInfo()->GetClassName(), NULL));
#endif
	}

	if(node)
	{
		node =  this->Serialize(node);
	}

	return node;
}

void xsSerializable::DeserializeObject(wxXmlNode* node)
{
	if(node && (node->GetName()==wxT("object")))
	{
		this->Deserialize(node);
	}
}

// protected functions //////////////////////////////////////////////////////////////

wxXmlNode* xsSerializable::Serialize(wxXmlNode* node)
{
    xsProperty* property;
    wxXmlNode* newNode;
    wxString val;

    wxPropertyListNode* propNode = m_lstProperties.GetFirst();
    while(propNode)
    {
        property = propNode->GetData();

        if(property->m_fSerialize)
        {
            newNode = NULL;

            if(property->m_sDataType == wxT("arraystring"))
            {
                wxArrayString array(*((wxArrayString*)property->m_pSourceVariable));

                size_t cnt = array.GetCount();
                if(cnt > 0)
                {
                    newNode = new wxXmlNode(wxXML_ELEMENT_NODE, wxT("property"));
                    for(size_t i = 0; i < cnt; i++)
                    {
                          AddPropertyNode(newNode, wxT("item"), array[i]);
                    }
                    node->AddChild(newNode);
                }
            }
            else if(property->m_sDataType == wxT("arrayrealpoint"))
            {
                RealPointArray array(*((RealPointArray*)property->m_pSourceVariable));

                size_t cnt = array.GetCount();
                if(cnt > 0)
                {
                    newNode = new wxXmlNode(wxXML_ELEMENT_NODE, wxT("property"));
                    for(size_t i = 0; i < cnt; i++)
                    {
                          AddPropertyNode(newNode, wxT("item"), RealPointToString(array[i]));
                    }
                    node->AddChild(newNode);
                }
            }
            else if(property->m_sDataType == wxT("listrealpoint"))
            {
                RealPointList *list = (RealPointList*)property->m_pSourceVariable;

                if(list->GetCount() > 0)
                {
                    newNode = new wxXmlNode(wxXML_ELEMENT_NODE, wxT("property"));
                    wxRealPointListNode* listNode = list->GetFirst();
                    while(listNode)
                    {
                        AddPropertyNode(newNode, wxT("item"), RealPointToString(*(wxRealPoint*)listNode->GetData()));
                        listNode = listNode->GetNext();
                    }
                    node->AddChild(newNode);
                }
            }
            else if( (property->m_sDataType == wxT("serializabledynamic")) ||
                    (property->m_sDataType == wxT("serializabledynamicnocreate")))
            {
                xsSerializable* object = *(xsSerializable**)(property->m_pSourceVariable);

                if( object && object->IsKindOf(CLASSINFO(xsSerializable)))
                {
                    newNode = new wxXmlNode(wxXML_ELEMENT_NODE, wxT("property"));
                    newNode->AddChild(object->SerializeObject(NULL));
                    node->AddChild(newNode);
                }
            }
            else if(property->m_sDataType == wxT("serializablestatic"))
            {
                newNode = new wxXmlNode(wxXML_ELEMENT_NODE, wxT("property"));
                newNode->AddChild((*((xsSerializable*)property->m_pSourceVariable)).SerializeObject(NULL));
                node->AddChild(newNode);
            }
            else
            {
                val = ConvertToString(property);

                if(val != property->m_sDefaultValueStr)
                {
                    newNode = AddPropertyNode(node, wxT("property"), val);
                }
            }

            if(newNode)
            {
                newNode->AddProperty(wxT("name"), property->m_sFieldName);
                newNode->AddProperty(wxT("type"), property->m_sDataType);
            }
        }

        propNode = propNode->GetNext();
    }

    return node;
}

void xsSerializable::Deserialize(wxXmlNode* node)
{
    wxASSERT(node);
    if(!node)return;

    xsProperty* property;
    wxString propName;

    wxXmlNode *xmlNode = node->GetChildren();
	while(xmlNode)
	{
	    if(xmlNode->GetName() == wxT("property"))
	    {
	        xmlNode->GetPropVal(wxT("name"), &propName);
	        property = GetProperty(propName);

	        if(property)
	        {
                if(property->m_sDataType == wxT("arraystring"))
                {
                    ((wxArrayString*)property->m_pSourceVariable)->Clear();

                    wxXmlNode *listNode = xmlNode->GetChildren();
                    while(listNode)
                    {
                        if(listNode->GetName() == wxT("item"))
                        {
#if wxCHECK_VERSION(2, 8, 0)
                            ((wxArrayString*)property->m_pSourceVariable)->Add(listNode->GetNodeContent());
#else // replacement code for old version
                            ((wxArrayString*)property->m_pSourceVariable)->Add(listNode->GetContent());
#endif
                        }

                        listNode = listNode->GetNext();
                    }
                }
                else if(property->m_sDataType == wxT("arrayrealpoint"))
                {
                    ((RealPointArray*)property->m_pSourceVariable)->Clear();

                    wxXmlNode *listNode = xmlNode->GetChildren();
                    while(listNode)
                    {
                        if(listNode->GetName() == wxT("item"))
                        {
#if wxCHECK_VERSION(2, 8, 0)
                            ((RealPointArray*)property->m_pSourceVariable)->Add(StringToRealPoint(listNode->GetNodeContent()));
#else // replacement code for old version
                            ((RealPointArray*)property->m_pSourceVariable)->Add(StringToRealPoint(listNode->GetContent()));
#endif
                        }

                        listNode = listNode->GetNext();
                    }
                }
                else if(property->m_sDataType == wxT("listrealpoint"))
                {
                    ((RealPointList*)property->m_pSourceVariable)->Clear();

                    wxXmlNode *listNode = xmlNode->GetChildren();
                    while(listNode)
                    {
                        if(listNode->GetName() == wxT("item"))
                        {
#if wxCHECK_VERSION(2, 8, 0)
                            ((RealPointList*)property->m_pSourceVariable)->Append(new wxRealPoint(StringToRealPoint(listNode->GetNodeContent())));
#else // replacement code for old version
                            ((RealPointList*)property->m_pSourceVariable)->Append(new wxRealPoint(StringToRealPoint(listNode->GetContent())));
#endif
                        }

                        listNode = listNode->GetNext();
                    }
                }
                else if(property->m_sDataType == wxT("serializabledynamic"))
                {
                    wxXmlNode *objectNode = xmlNode->GetChildren();

                    if( objectNode && (objectNode->GetName() == wxT("object")) )
                    {
                        *(xsSerializable**)(property->m_pSourceVariable) = (xsSerializable*)wxCreateDynamicObject(objectNode->GetPropVal(wxT("type"), wxT("")));

                        xsSerializable* object = *(xsSerializable**)(property->m_pSourceVariable);
                        if(object)
                        {
                            object->DeserializeObject(objectNode);
                        }
                    }
                }
                else if(property->m_sDataType == wxT("serializabledynamicnocreate"))
                {
                    wxXmlNode *objectNode = xmlNode->GetChildren();

                    if( objectNode && (objectNode->GetName() == wxT("object")) )
                    {
                        xsSerializable* object = *(xsSerializable**)(property->m_pSourceVariable);
                        if(object)
                        {
                            object->DeserializeObject(objectNode);
                        }
                    }
                }
                else if(property->m_sDataType == wxT("serializablestatic"))
                {
                    wxXmlNode *objectNode = xmlNode->GetChildren();

                    if( objectNode && (objectNode->GetName() == wxT("object")) )
                    {
                        (*((xsSerializable*)property->m_pSourceVariable)).DeserializeObject(objectNode);
                    }
                }
                else
                {
#if wxCHECK_VERSION(2, 8, 0)
                    FillFromString(xmlNode->GetNodeContent(), property);
#else // replacement code for old version
                    FillFromString(xmlNode->GetContent(), property);
#endif
                }
	        }
	    }

	    xmlNode = xmlNode->GetNext();
	}
}

wxXmlNode* xsSerializable::AddPropertyNode(wxXmlNode* parent, const wxString& name, const wxString& value)
{
	if(parent)
	{
		wxXmlNode* child = new wxXmlNode(wxXML_ELEMENT_NODE, name);
		child->AddChild(new wxXmlNode(wxXML_TEXT_NODE, wxT(""), value));
		parent->AddChild(child);
		return child;
	}
	return NULL;
}

/////////////////////////////////////////////////////////////////////////////////////
// wxXmlSerializer class ////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

IMPLEMENT_DYNAMIC_CLASS(wxXmlSerializer, wxObject);

// constructor and destructor ///////////////////////////////////////////////////////

wxXmlSerializer::wxXmlSerializer()
{
    m_pRoot = new xsSerializable();
}
wxXmlSerializer::wxXmlSerializer(const wxString& owner, const wxString& root, const wxString& version)
{
    m_sOwner = owner;
    m_sRootName = root;
    m_sVersion = version;

    m_pRoot = new xsSerializable();
}

wxXmlSerializer::~wxXmlSerializer()
{
    if( m_pRoot ) delete m_pRoot;
}

// public functions //////////////////////////////////////////////////////////////////

xsSerializable* wxXmlSerializer::GetItem(long id)
{
    if( m_pRoot )
    {
        return _GetItem(id, m_pRoot);
    }

    return NULL;
}

int wxXmlSerializer::GetItems(wxClassInfo* type, SerializableList& list)
{
    m_nCounter = 0;

    if( m_pRoot )
    {
        _GetItems(type, m_pRoot, list);
    }

    return m_nCounter;
}

void wxXmlSerializer::AddItem(long parentId, xsSerializable* item)
{
    AddItem(GetItem(parentId), item);
}

void wxXmlSerializer::AddItem(xsSerializable* parent, xsSerializable* item)
{
    wxASSERT(m_pRoot);
    wxASSERT(item);

    if( item )
    {
        if( parent )parent->AddChild(item);
		else
			m_pRoot->AddChild(item);

        item->SetId(GetNewId());
    }
}

void wxXmlSerializer::RemoveItem(long id)
{
    RemoveItem(GetItem(id));
}

void wxXmlSerializer::RemoveItem(xsSerializable* item)
{
    wxASSERT(item);

    if(item)
    {
        if( item->GetParent() )
        {
            item->GetParent()->GetChildren().DeleteObject(item);
        }
        delete item;
    }
}

void wxXmlSerializer::RemoveAll()
{
    if( m_pRoot )
    {
        delete m_pRoot;
    }

    //xsSerializable::m_nItemCounter = 0;
    m_pRoot = new xsSerializable();
}

void wxXmlSerializer::SetRootItem(xsSerializable* root)
{
    wxASSERT(root);
    wxASSERT(root->IsKindOf(CLASSINFO(xsSerializable)));

    if(root && root->IsKindOf(CLASSINFO(xsSerializable)))
    {
        if(m_pRoot)delete m_pRoot;
        m_pRoot = root;
    }
}

void wxXmlSerializer::SerializeToXml(const wxString& file)
{
	wxFileOutputStream outstream(file);

	if(outstream.IsOk())
	{
		this->SerializeToXml(outstream);
	}
	else
		wxMessageBox(wxT("Unable to initialize output file stream."), m_sOwner, wxICON_ERROR);
}

void wxXmlSerializer::SerializeToXml(wxOutputStream& outstream)
{
	// create root node
	wxXmlNode *root = new wxXmlNode(wxXML_ELEMENT_NODE, m_sRootName);

	if(root)
	{
	    // add version
	    root->AddProperty(wxT("owner"), m_sOwner);
	    root->AddProperty(wxT("version"), m_sVersion);

		// serialize shapes recursively
		this->SerializeObjects(m_pRoot, root, false);

		// create XML document
		try
		{
			wxXmlDocument xmlDoc;
			xmlDoc.SetRoot(root);

#if wxCHECK_VERSION(2, 8, 0)
			xmlDoc.Save(outstream, 2);
#else // replacement code for old version
			xmlDoc.Save(outstream);
#endif
		}
		catch (...)
		{
			wxMessageBox(wxT("Unable to save XML document."), m_sOwner, wxICON_ERROR);
		}
	}
}

void wxXmlSerializer::DeserializeFromXml(const wxString& file)
{
	wxFileInputStream instream(file);
	if(instream.IsOk())
	{
		this->DeserializeFromXml(instream);
	}
	else
		wxMessageBox(wxT("Unable to initialize input stream."), m_sOwner, wxICON_ERROR);
}

void wxXmlSerializer::DeserializeFromXml(wxInputStream& instream)
{
	// load an XML file
	try
	{
		wxXmlDocument xmlDoc;
		xmlDoc.Load(instream);

		wxXmlNode* root = xmlDoc.GetRoot();
		if(root && (root->GetName() == m_sRootName))
		{
		    // read project node's properties here...
		    wxString version, owner;
		    root->GetPropVal(wxT("owner"), &owner);
		    root->GetPropVal(wxT("version"), &version);

		    if( (owner == m_sOwner) && (version == m_sVersion) )
		    {
                // read shape objects from XML recursively
                this->DeserializeObjects(NULL, root);
		    }
            else
                wxMessageBox(wxT("No matching owner or file version."), m_sOwner, wxICON_WARNING);
		}
		else
			wxMessageBox(wxT("Unknown file format."), m_sOwner, wxICON_WARNING);
	}
	catch (...)
	{
		wxMessageBox(wxT("Unable to load XML file."), m_sOwner, wxICON_ERROR);
	}
}

void wxXmlSerializer::SerializeObjects(xsSerializable* parent, wxXmlNode* node, bool withparent)
{
    wxASSERT(parent);
    if(!parent)return;

	wxXmlNode* projectNode = NULL;
	xsSerializable* pChild;

	// serialize parent shape
	if(withparent)
	{
	    if(parent->IsSerialized())
	    {
            projectNode = parent->SerializeObject(NULL);
            if(projectNode)
            {
                SerializeObjects(parent, projectNode, false);
                node->AddChild(projectNode);
            }
	    }
	}
	else
	{
		// serialize parent's children
		wxSerializableListNode* snode = parent->GetChildren().GetFirst();
		while(snode)
		{
			pChild = snode->GetData();

            if(pChild->IsSerialized())
            {
                projectNode = pChild->SerializeObject(NULL);
                if(projectNode)
                {
                    SerializeObjects(pChild, projectNode, false);
                    node->AddChild(projectNode);
                }
            }

			snode = snode->GetNext();
		}
	}
}

void wxXmlSerializer::DeserializeObjects(xsSerializable* parent, wxXmlNode* node)
{
    wxASSERT(m_pRoot);
    if(!m_pRoot)return;

	xsSerializable *pItem;

	wxXmlNode* projectNode = node->GetChildren();
	while(projectNode)
	{
		if(projectNode->GetName() == wxT("object"))
		{
		    pItem = (xsSerializable*)wxCreateDynamicObject(projectNode->GetPropVal(wxT("type"), wxT("")));
			if(pItem)
			{
			    pItem->SetId(GetNewId());

			    if(parent)
			    {
			        parent->AddChild(pItem);
			    }
			    else
                    m_pRoot->AddChild(pItem);

				pItem->DeserializeObject(projectNode);

				// deserialize child objects
				DeserializeObjects(pItem, projectNode);
			}
		}
		projectNode = projectNode->GetNext();
	}
}

bool wxXmlSerializer::IsIdUsed(long id)
{
	return (GetIDCount(id) > 0);
}

int wxXmlSerializer::GetIDCount(long id)
{
	int nCount = 0;

    SerializableList items;
    GetItems(CLASSINFO(xsSerializable), items);

	wxSerializableListNode *node = items.GetFirst();
	while(node)
	{
		if(node->GetData()->GetId() == id)nCount++;
		node = node->GetNext();
	}

	return nCount;
}

long wxXmlSerializer::GetNewId()
{
	long nId = 1;

	while(IsIdUsed(nId))nId++;

	return nId;
}

// private virtual functions  ///////////////////////////////////////////////////////

xsSerializable* wxXmlSerializer::_GetItem(long id, xsSerializable* parent)
{
    wxASSERT(parent);

    if( !parent )return NULL;

    if( parent->GetId() == id )return parent;

    xsSerializable *pItem = NULL;
    wxSerializableListNode* node = parent->GetChildren().GetFirst();
    while(node)
    {
        pItem = _GetItem(id, node->GetData());
        if( pItem )break;
        node = node->GetNext();
    }
    return pItem;
}

void wxXmlSerializer::_GetItems(wxClassInfo* type, xsSerializable* parent, SerializableList& list)
{
    wxASSERT(parent);
    wxASSERT(type);

    if(!parent && !type)return;

    if( parent->IsKindOf(type) )
    {
        list.Append(parent);
        m_nCounter++;
    }

    wxSerializableListNode* node = parent->GetChildren().GetFirst();
    while(node)
    {
        _GetItems(type, node->GetData(), list);
        node = node->GetNext();
    }
}