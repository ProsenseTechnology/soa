<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:ns0="http://xmlns.oracle.com/EnterpriseService_Transactions/BillPaymentES/NotifyBill"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/top/StagingDB"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Bill/V1"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 ns1 tns xp20 oraxsl mhdr oraext dvm xref socket"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns2="http://xmlns.oracle.com/EnterpriseService.Transactions/TransferES/Chai.PaymentPS"
                xmlns:ns3="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:ns4="http://xmlns.oracle.com/pcbpel/adapter/db/EnterpriseService.Transactions/BillPaymentES/StagingDB"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/NotifyBill.wsdl"/>
        <oracle-xsl-mapper:rootElement name="NotifyBillRequest"
                                       namespace="http://xmlns.oracle.com/EnterpriseService_Transactions/BillPaymentES/NotifyBill"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/Chai.PaymentPS.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Bill/V1"/>
        <oracle-xsl-mapper:param name="InvokeChaiPaidProvOutputVariable.reply"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/StagingDB.wsdl"/>
        <oracle-xsl-mapper:rootElement name="CustMasterTranTableCollection"
                                       namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/StagingDB"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [TUE MAY 26 10:38:46 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="InvokeChaiPaidProvOutputVariable.reply"/>
  <xsl:template match="/">
    <tns:CustMasterTranTableCollection>
      <xsl:for-each select="/ns0:NotifyBillRequest/ns0:Payments">
        <tns:CustMasterTranTable>
          <tns:status>N</tns:status>
          <tns:id>
            <xsl:value-of select="ns0:id"/>
          </tns:id>
        </tns:CustMasterTranTable>
      </xsl:for-each>
    </tns:CustMasterTranTableCollection>
  </xsl:template>
</xsl:stylesheet>