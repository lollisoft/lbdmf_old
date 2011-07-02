<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">
<xsl:import href="exsl.xsl"/>

<xsl:template name="CommandMap.cs">
<xsl:param name="ApplicationID"/><xsl:param name="ApplicationName"/>//------------------------------------------------------------------------------
// &lt;auto-generated&gt;
//     This code was generated by a tool.
//     Runtime Version:2.0.50215.44
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// &lt;/auto-generated&gt;
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by xsd, Version=2.0.50215.44.
// 
namespace ShellApplication {
    using System.Xml.Serialization;
    
    
    /// &lt;remarks/&gt;
    [System.SerializableAttribute()]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://schemas.microsoft.com/pag/cab-command-map")]
    [System.Xml.Serialization.XmlRootAttribute(Namespace="http://schemas.microsoft.com/pag/cab-command-map", IsNullable=false)]
    public partial class CommandMap {
        
        private Mapping[] mappingField;
        
        /// &lt;remarks/&gt;
        [System.Xml.Serialization.XmlElementAttribute("Mapping")]
        public Mapping[] Mapping {
            get {
                return this.mappingField;
            }
            set {
                this.mappingField = value;
            }
        }
    }
    
    /// &lt;remarks/&gt;
    [System.SerializableAttribute()]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://schemas.microsoft.com/pag/cab-command-map")]
    public partial class Mapping {
        
        private string siteField;
        
        private string commandNameField;
        
        private string labelField;
        
        /// &lt;remarks/&gt;
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string Site {
            get {
                return this.siteField;
            }
            set {
                this.siteField = value;
            }
        }
        
        /// &lt;remarks/&gt;
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string CommandName {
            get {
                return this.commandNameField;
            }
            set {
                this.commandNameField = value;
            }
        }
        
        /// &lt;remarks/&gt;
        [System.Xml.Serialization.XmlAttributeAttribute()]
        public string Label {
            get {
                return this.labelField;
            }
            set {
                this.labelField = value;
            }
        }
    }
}
</xsl:template>
</xsl:stylesheet>
