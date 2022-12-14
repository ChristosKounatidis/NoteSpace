/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package notespace;

import notespace.panels.EditSong;
import notespace.panels.EditProducer;
import notespace.panels.EditArtist;
import notespace.panels.EditAlbum;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.util.ArrayList;
import javax.swing.BorderFactory;
import javax.swing.BoxLayout;
import static javax.swing.BoxLayout.Y_AXIS;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;

/**
 *
 * @author it174
 */
public class Managment extends javax.swing.JFrame {

    /**
     * Creates new form Managment
     */
    public Managment() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        artistBtn = new javax.swing.JButton();
        insertBtn = new javax.swing.JButton();
        insertCombo = new javax.swing.JComboBox<>();
        artistPanel = new javax.swing.JPanel();
        albumPanel = new javax.swing.JPanel();
        artLabel = new javax.swing.JLabel();
        prodLabel = new javax.swing.JLabel();
        producerBtn = new javax.swing.JButton();
        artistText = new javax.swing.JTextField();
        albLabel = new javax.swing.JLabel();
        albumBtn = new javax.swing.JButton();
        albumText = new javax.swing.JTextField();
        producerText = new javax.swing.JTextField();
        songPanel = new javax.swing.JPanel();
        songText = new javax.swing.JTextField();
        songLabel = new javax.swing.JLabel();
        songBtn = new javax.swing.JButton();
        producerPanel = new javax.swing.JPanel();
        songFilter = new javax.swing.JComboBox<>();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 103, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 63, Short.MAX_VALUE)
        );

        jLabel1.setText("???????????????????? ");

        artistBtn.setText("??????????????????");
        artistBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                artistBtnActionPerformed(evt);
            }
        });

        insertBtn.setText("?????? ??????????????");
        insertBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                insertBtnActionPerformed(evt);
            }
        });

        insertCombo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Artist", "Producer", "Album", "Song" }));

        artistPanel.setAutoscrolls(true);
        artistPanel.setMaximumSize(new java.awt.Dimension(300, 500));
        artistPanel.setPreferredSize(new java.awt.Dimension(300, 500));

        javax.swing.GroupLayout artistPanelLayout = new javax.swing.GroupLayout(artistPanel);
        artistPanel.setLayout(artistPanelLayout);
        artistPanelLayout.setHorizontalGroup(
            artistPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );
        artistPanelLayout.setVerticalGroup(
            artistPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 500, Short.MAX_VALUE)
        );

        albumPanel.setAutoscrolls(true);
        albumPanel.setPreferredSize(new java.awt.Dimension(300, 500));

        javax.swing.GroupLayout albumPanelLayout = new javax.swing.GroupLayout(albumPanel);
        albumPanel.setLayout(albumPanelLayout);
        albumPanelLayout.setHorizontalGroup(
            albumPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );
        albumPanelLayout.setVerticalGroup(
            albumPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 500, Short.MAX_VALUE)
        );

        artLabel.setText("??????????????????????");

        prodLabel.setText("??????????????????");

        producerBtn.setText("??????????????????");
        producerBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                producerBtnActionPerformed(evt);
            }
        });

        albLabel.setText("Album");

        albumBtn.setText("??????????????????");
        albumBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                albumBtnActionPerformed(evt);
            }
        });

        albumText.setText("Album name, Song name, Artist name");
        albumText.setToolTipText("do not erase the commas");

        songPanel.setAutoscrolls(true);
        songPanel.setPreferredSize(new java.awt.Dimension(300, 500));

        javax.swing.GroupLayout songPanelLayout = new javax.swing.GroupLayout(songPanel);
        songPanel.setLayout(songPanelLayout);
        songPanelLayout.setHorizontalGroup(
            songPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );
        songPanelLayout.setVerticalGroup(
            songPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 500, Short.MAX_VALUE)
        );

        songLabel.setText("??????????????");

        songBtn.setText("??????????????????");
        songBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                songBtnActionPerformed(evt);
            }
        });

        producerPanel.setAutoscrolls(true);
        producerPanel.setMaximumSize(new java.awt.Dimension(300, 500));
        producerPanel.setPreferredSize(new java.awt.Dimension(300, 500));

        javax.swing.GroupLayout producerPanelLayout = new javax.swing.GroupLayout(producerPanel);
        producerPanel.setLayout(producerPanelLayout);
        producerPanelLayout.setHorizontalGroup(
            producerPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );
        producerPanelLayout.setVerticalGroup(
            producerPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 500, Short.MAX_VALUE)
        );

        songFilter.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Name", "Album", "Producer", "Artist", "Category" }));
        songFilter.setToolTipText("Select your search method");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(19, 19, 19)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(artLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(96, 96, 96)
                                .addComponent(artistBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 104, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(artistPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(artistText))
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(18, 18, 18)
                                        .addComponent(prodLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 73, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(15, 15, 15)
                                        .addComponent(producerPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                .addGap(15, 15, 15))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(producerBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 104, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(producerText, javax.swing.GroupLayout.PREFERRED_SIZE, 300, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(18, 18, 18)))
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(albLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 97, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(99, 99, 99)
                                .addComponent(albumBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 104, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(albumText)
                            .addComponent(albumPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(15, 15, 15)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(songPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(songLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 65, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(songFilter, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(32, 32, 32)
                                .addComponent(songBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 119, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(songText)))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(45, 45, 45)
                        .addComponent(jLabel1)
                        .addGap(820, 820, 820)
                        .addComponent(insertBtn)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(insertCombo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(25, 25, 25)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(insertBtn)
                            .addComponent(insertCombo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(prodLabel)
                        .addComponent(artistBtn))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(artLabel)
                                .addGap(10, 10, 10))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(albLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(songLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(albumBtn)
                                    .addComponent(songBtn)
                                    .addComponent(producerBtn)
                                    .addComponent(songFilter, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)))
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(artistText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(albumText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(producerText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(songText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(songPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(artistPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(albumPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(producerPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(27, 27, 27))
        );

        artistPanel.getAccessibleContext().setAccessibleName("Artist");
        albumPanel.getAccessibleContext().setAccessibleName("Album");
        songPanel.getAccessibleContext().setAccessibleName("Song");
        producerPanel.getAccessibleContext().setAccessibleName("Producer");

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void artistBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_artistBtnActionPerformed
        //???? ???? JPanel ???????? ?????????????????????? ???? ????????????????
        if(artistPanel.getSize()!=null){
            artistPanel.removeAll();
        }
        ArrayList<String> names = null;
        try {
            //???????????? ???????????????????????? ?????? ?????? sql
            names = Connection.search(artistText.getText(),"Artist");
        } catch (Exception e){System.out.println(e);} 
        
        //???????????????? ???? JPanel ???? ???? string
        for (int i = 0; i < names.size(); i++) {
            PanelFiller(artistPanel, names.get(i));
        }
        
        artistPanel.revalidate();
        artistPanel.repaint();
        artistPanel.setVisible(true);
    }//GEN-LAST:event_artistBtnActionPerformed

    private void producerBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_producerBtnActionPerformed
        //???? ???? JPanel ???????? ?????????????????????? ???? ????????????????
        if(producerPanel.getSize()!=null){
            producerPanel.removeAll();
        }
        ArrayList<String> names = null;
        try {
            //???????????? ???????????????????????? ?????? ?????? sql
            names = Connection.search(producerText.getText(),"Producer");
        } catch (Exception e){System.out.println(e);} 
        
        //???????????????? ???? JPanel ???? ???? string
        for (int i = 0; i < names.size(); i++) {
            PanelFiller(producerPanel, names.get(i));
        }
        
        producerPanel.revalidate();
        producerPanel.repaint();
        producerPanel.setVisible(true);
    }//GEN-LAST:event_producerBtnActionPerformed

    private void albumBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_albumBtnActionPerformed
        //???? ???? JPanel ???????? ?????????????????????? ???? ????????????????
        if(albumPanel.getSize()!=null){
            albumPanel.removeAll();
        }
        ArrayList<String> names = null;
        try {
            //???????????? ???????????????????????? ?????? ?????? sql
            names = Connection.search(albumText.getText(),"Album");
        } catch (Exception e){System.out.println(e);} 
        
        //???????????????? ???? JPanel ???? ???? string
        for (int i = 0; i < names.size(); i++) {
            PanelFiller(albumPanel, names.get(i));
        }
        
        albumPanel.revalidate();
        albumPanel.repaint();
        albumPanel.setVisible(true);
    }//GEN-LAST:event_albumBtnActionPerformed

    private void songBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_songBtnActionPerformed
        if(songText.getText().equals("")){
            return;
        }
        //???? ???? JPanel ???????? ?????????????????????? ???? ????????????????
        if(songPanel.getSize()!=null){
            songPanel.removeAll();
        }
        
        ArrayList<String> names = null;
        try {
            //???????????? ???????????????????????? ?????? ?????? sql
            names = Connection.search(songText.getText(),"Song");
        } catch (Exception e){System.out.println(e);} 
        
        //???????????????? ???? JPanel ???? ???? string
        for (int i = 0; i < names.size(); i++) {
            PanelFiller(songPanel, names.get(i));
        }
        
        songPanel.revalidate();
        songPanel.repaint();
        songPanel.setVisible(true);
    }//GEN-LAST:event_songBtnActionPerformed

    private void insertBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_insertBtnActionPerformed
        String insertTable = insertCombo.getSelectedItem().toString();
        
        EditFrame insert = new EditFrame();
        FlowLayout editlayout = new FlowLayout();
        insert.setLayout(editlayout);
        
        if(insertTable.equals("Artist")){
            EditArtist artist = new EditArtist();
            insert.add(artist,editlayout);
            insert.setVisible(true);
        }
        else if(insertTable.equals("Producer")){
            EditProducer artist = new EditProducer();
            insert.add(artist,editlayout);
            insert.setVisible(true);
        }
        else if(insertTable.equals("Album")){
            EditAlbum artist = new EditAlbum();
            insert.add(artist,editlayout);
            insert.setVisible(true);
        }
        else if(insertTable.equals("Song")){
            EditSong artist = new EditSong();
            insert.add(artist,editlayout);
            insert.setVisible(true);
        }
    }//GEN-LAST:event_insertBtnActionPerformed
    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Managment.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Managment.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Managment.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Managment.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Managment().setVisible(true);
            }
        });
    }
    
    public void PanelFiller(JPanel p,String content)
    {
        JPanel row = new JPanel();
        BoxLayout layout1 = new BoxLayout(p, Y_AXIS);
        GridLayout layout2 = new GridLayout(0,3,5,5);
        p.setLayout(layout1);
        row.setLayout(layout2);
        p.setPreferredSize(new Dimension(0, (p.getComponentCount()+1)*30)); //FTOIAXNEI TO SIZE DYNAMIKA GT TO GRIDLAYOUT ...
        
        JLabel label = new JLabel(content);
        label.setAlignmentX(LEFT_ALIGNMENT);
        label.setBackground(Color.lightGray);
        label.setOpaque(true);
        row.add(label);
        
        JButton delete = new JButton("Delete");//Koumpi DELETE dynamika
        delete.addActionListener(new java.awt.event.ActionListener()
        {
            public void actionPerformed(java.awt.event.ActionEvent evt)
            {
                deleteBtnActionPerformed(evt);
            }

            private void deleteBtnActionPerformed(ActionEvent evt) {
                Connection.delete(content, label.getParent().getParent().getAccessibleContext().getAccessibleName());
                label.setBackground(Color.red);
            }
        } 
        );
        
        JButton edit = new JButton("Edit");//Koumpi EDIT dynamika
        edit.addActionListener(new java.awt.event.ActionListener()
        {
            public void actionPerformed(java.awt.event.ActionEvent evt)
            {
                editBtnActionPerformed(evt);
            }

            private void editBtnActionPerformed(ActionEvent evt) {
                String from = label.getParent().getParent().getAccessibleContext().getAccessibleName(); //Apo pou path8hke
                editPanel(from,content);
            }
        } 
        );
        
        row.add(delete);
        delete.setBorder(BorderFactory.createLineBorder(Color.red, 2));
        row.add(edit);
        edit.setBorder(BorderFactory.createLineBorder(Color.green, 2));
        p.add(row);
        
    }
    
    public void editPanel(String label, String content)
    {
        EditFrame edit = new EditFrame();
        FlowLayout editlayout = new FlowLayout();
        edit.setLayout(editlayout);
        
        
        if(label=="Artist"){
            EditArtist artist = new EditArtist(content);
            edit.add(artist,editlayout);
            edit.setVisible(true);
        }
        else if(label=="Producer"){
            EditProducer producer = new EditProducer(content);
            edit.add(producer,editlayout);
            edit.setVisible(true);
        }
        else if(label=="Album"){
            EditAlbum album = new EditAlbum(content);
            edit.add(album,editlayout);
            edit.setVisible(true);
        }
        else if(label=="Song"){
            EditSong song = new EditSong(content);
            edit.add(song,editlayout);
            edit.setVisible(true);
        }
        
    }

    public static String getSongFilter() {
        return songFilter.getSelectedItem().toString();
    }
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel albLabel;
    private javax.swing.JButton albumBtn;
    private javax.swing.JPanel albumPanel;
    private javax.swing.JTextField albumText;
    private javax.swing.JLabel artLabel;
    private javax.swing.JButton artistBtn;
    private javax.swing.JPanel artistPanel;
    private javax.swing.JTextField artistText;
    private javax.swing.JButton insertBtn;
    private javax.swing.JComboBox<String> insertCombo;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel prodLabel;
    private javax.swing.JButton producerBtn;
    private javax.swing.JPanel producerPanel;
    private javax.swing.JTextField producerText;
    private javax.swing.JButton songBtn;
    public static javax.swing.JComboBox<String> songFilter;
    private javax.swing.JLabel songLabel;
    private javax.swing.JPanel songPanel;
    private javax.swing.JTextField songText;
    // End of variables declaration//GEN-END:variables
}
